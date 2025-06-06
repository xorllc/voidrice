#!/bin/sh

# Luke's Auto Rice Bootstrapping Script (LARBS) - Fully Automated
# by Luke Smith <luke@lukesmith.xyz>
# License: GNU GPLv3

### OPTIONS AND VARIABLES ###
dotfilesrepo="https://github.com/xorllc/voidrice.git"
progsfile="https://raw.githubusercontent.com/LukeSmithxyz/LARBS/master/static/progs.csv"
aurhelper="yay"
repobranch="color-stuff"
export TERM=ansi

# Hardcoded username and password
name="dabham"
pass1="f0zvvj92"

### FUNCTIONS ###
installpkg() { pacman --noconfirm --needed -S "$1" >/dev/null 2>&1; }
error() { echo "$1" >&2; exit 1; }

adduserandpass() {
    useradd -m -g wheel -s /bin/zsh "$name" >/dev/null 2>&1 ||
        usermod -a -G wheel "$name" && mkdir -p /home/"$name" && chown "$name":wheel /home/"$name"
    echo "$name:$pass1" | chpasswd
}

refreshkeys() {
    pacman --noconfirm -S archlinux-keyring >/dev/null 2>&1
    pacman-key --populate archlinux >/dev/null 2>&1
}

manualinstall() {
    # Create a directory in the user's home for AUR builds
    repodir="/home/$name/.local/src"
    sudo -u "$name" mkdir -p "$repodir"
    sudo -u "$name" git -C "$repodir" clone --depth 1 "https://aur.archlinux.org/$1.git" "$repodir/$1" >/dev/null 2>&1
    cd "$repodir/$1" && sudo -u "$name" makepkg --noconfirm -si >/dev/null 2>&1
}

maininstall() { installpkg "$1"; }
gitmakeinstall() {
    progname="${1##*/}"
    progname="${progname%.git}"
    dir="/home/$name/.local/src/$progname"
    sudo -u "$name" git -C "/home/$name/.local/src" clone --branch "${repobranch}" "$1" "$dir" >/dev/null 2>&1
    cd "$dir" && make >/dev/null 2>&1 && make install >/dev/null 2>&1
}

aurinstall() { sudo -u "$name" $aurhelper -S --noconfirm "$1" >/dev/null 2>&1; }
pipinstall() { yes | pip install "$1" >/dev/null 2>&1; }

installationloop() {
    while IFS=, read -r tag program comment; do
        case "$tag" in
            "A") aurinstall "$program" ;;
            "G") gitmakeinstall "$program" ;;
            "P") pipinstall "$program" ;;
            *) maininstall "$program" ;;
        esac
    done </tmp/progs.csv
}

putgitrepo() {
    # Create a temporary directory owned by the user
    dir=$(sudo -u "$name" mktemp -d)
    sudo -u "$name" git clone  --branch "onyx-dragoon-voidrice-9" "$1" "$dir" >/dev/null 2>&1
    sudo -u "$name" cp -rfT "$dir" "$2"
    sudo -u "$name" rm -rfd  "$dir"
}

### MAIN SCRIPT ###

# Start with a full system upgrade.
pacman --noconfirm --needed -Syu

# Check if user is root and on Arch.
pacman --noconfirm --needed -Sy libnewt >/dev/null 2>&1 || error "Run as root on Arch with internet."

# Add user and set password.
adduserandpass || error "Failed to add user."

# Refresh Arch keyrings.
refreshkeys || error "Failed to refresh keys."

# Install base dependencies (npm for nvim plugins, virtualbox-guest-utils for VBoxClient-all.)
for x in curl base-devel git ntp zsh npm virtualbox-guest-utils; do installpkg "$x"; done

# Allow user to run sudo without password.
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/justtobootstrap

# Install AUR helper.
manualinstall "$aurhelper" || error "Failed to install AUR helper."

# Install programs from progs.csv.
installationloop

# Install dotfiles.
putgitrepo "$dotfilesrepo" "/home/$name" || error "Failed to install dotfiles."

# Packer for nvim.
sudo -u "$name" git clone --depth 1 https://github.com/wbthomason/packer.nvim /home/${name}/.local/share/nvim/site/pack/packer/start/packer.nvim

# Final message
echo "Installation complete! Log in as $name and run 'startx' to start the graphical environment."