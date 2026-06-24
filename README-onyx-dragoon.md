# How to set the scroll direction for a trackpad

1. From `xinput list`, determine the ID of the device. In my case, it's "10":
  1. Synaptics tm2964-001                      id=10   [slave  pointer  (2)]
  2. `pacman -F xorg` shows `xorg-input` as the package to install.
2. From `xinput list-props 10 | grep -i "Natural Scrolling"`, note the configuration value and the value it's currently set to. 0 means off, 1 means on.
3. Run `xinput set-prop 10 311 1` where 10 is the device, 311 is the configuration parameter, 1 means "on", that is, enable natural scrolling.


root login shell

usermod --shell /bin/zsh root
NOTE: PS1 is in .config/zsh/.zshrc

TODO

* nvidia-settings sometimes reverts to a lower refresh rate if pacman Syu updates nvidia.
* run ntpd -gq after rebooting from windows.
* reminder to edit .ssh/config when switching to bitizer.


# Host github.com
#   IdentityFile ~/.ssh/bitizer
#   IdentitiesOnly yes



Sometimes, a dbus update, pacman -Syu, etc. screws audio up, which can manifest in dwmblocks malfunctioning.
Try blowing away pipewire, pactl, wpctl, and pulseaudio. Then reinstall (pulse stuff first, then pipewire...then pipewire-pulse last, I guess).
[onyx-dragoon@zaksab37 ~]$ sudo pacman -Rcns pipewire
checking dependencies...
:: electron22 optionally requires pipewire: WebRTC desktop sharing under Wayland
:: electron25 optionally requires pipewire: WebRTC desktop sharing under Wayland
:: electron27 optionally requires pipewire: WebRTC desktop sharing under Wayland
:: electron28 optionally requires pipewire: WebRTC desktop sharing under Wayland
:: google-chrome optionally requires pipewire: WebRTC desktop sharing under Wayland
:: libpulse optionally requires pulse-native-provider: PulseAudio backend
:: librewolf-bin optionally requires pulseaudio: Audio support
:: openal optionally requires libmysofa: makemhr tool
:: pavucontrol optionally requires pulseaudio: Audio backend
:: sdl2 optionally requires pipewire: PipeWire audio driver
warning: dependency cycle detected:
warning: libcamera-ipa will be removed after its libcamera dependency

Packages (23) alsa-card-profiles-1:1.0.4-4  bluez-libs-5.73-4  libcamera-0.2.0-1
              libcamera-ipa-0.2.0-1  libfdk-aac-2.0.3-1  libfreeaptx-0.1.1-1
              liblc3-1.1.0-1  libldac-2.0.2.3-1  libmysofa-1.3.2-1
              libwireplumber-0.5.1-1  libyaml-0.2.5-2  lilv-0.24.24-1
              lv2-1.18.10-1  pipewire-audio-1:1.0.4-4  pipewire-pulse-1:1.0.4-4
              sbc-2.0-1  serd-0.32.2-1  sord-0.16.16-1  sratom-0.6.16-1
              webrtc-audio-processing-1-1.3-2  wireplumber-0.5.1-1  zix-0.4.2-2
              pipewire-1:1.0.4-4

Total Removed Size:  18.94 MiB

:: Do you want to remove these packages? [Y/n]


more notes on NTPD:
[onyx-dragoon@desktop ~]$ pacman -S ntp-runit
resolving dependencies...
looking for conflicting packages...

Packages (1) ntp-runit-20210301-3

Total Download Size:   0.00 MiB
Total Installed Size:  0.00 MiB

:: Proceed with installation? [Y/n]
:: Retrieving packages...
 ntp-runit-20210301-3-any                               2.3 KiB  4.60 KiB/s 00:01 [----------------------------------------------] 100%
(1/1) checking keys in keyring                                                    [----------------------------------------------] 100%
(1/1) checking package integrity                                                  [----------------------------------------------] 100%
(1/1) loading package files                                                       [----------------------------------------------] 100%
(1/1) checking for file conflicts                                                 [----------------------------------------------] 100%
(1/1) checking available disk space                                               [----------------------------------------------] 100%
:: Processing package changes...
(1/1) installing ntp-runit                                                        [----------------------------------------------] 100%
:: Running post-transaction hooks...
(1/1) Displaying runit service help ...
        ==> Add a service:
        ln -s /etc/runit/sv/<service> /run/runit/service/
        ==> Start/stop/restart a service:
        sv <start/stop/restart> <service>
[onyx-dragoon@desktop ~]$ ln -s /etc/runit/sv/ntpd /run/runit/service/
ln: failed to create symbolic link '/run/runit/service/ntpd': Permission denied
[onyx-dragoon@desktop ~]$ sudo -i
[root@desktop ~]$ ln -s /etc/runit/sv/<service> /run/runit/service/
zsh: no such file or directory: service
[root@desktop ~]$ ln -s /etc/runit/sv/ntpd /run/runit/service/
[root@desktop ~]$ sv start ntpd
ok: run: ntpd: (pid 7499) 12s
[root@desktop ~]$ date
Thu Apr 25 01:18:44 AM EDT 2024
[root@desktop ~]$


## How to record audio

```
rm test-mic.wav
arecord -d 5 test-mic.wav
rm test-mic.wav
arecord -d 5 test-mic.wav
mpv test-mic.wav
vim .xprofile
sudo su -
nvidia-settings
sudo nvidia-settings
sudo nvidia-settings
arecord -vvv -f dat /dev/null
arecord -vvv -f dat /dev/null
arecord -d 5 test-mic.wav
mpv test-mic.wav
vim Downloads/snippets
```

## How to remove Daedalus

```
chmod -R +w ~/.daedalus
rm -rf ~/.local/bin/daedalus-mainnet
rm -f ~/.local/share/applications/Daedalus-mainnet.desktop
rm -rf ~/.config/Daedalus\ Mainnet
rm -rf ~/.local/share/Daedalus/mainnet
```



## Other Stuff to Install
[onyx-dragoon@desktop ~]$ xset r rate 300 50

zsh: command not found: xset
[onyx-dragoon@desktop ~]$ vim README.md
[onyx-dragoon@desktop ~]$ vim README-onyx-dragoon.md
[onyx-dragoon@desktop ~]$ pacman -Qs xset
[onyx-dragoon@desktop ~]$ pacman -Q xset
error: package 'xset' was not found
[onyx-dragoon@desktop ~]$ pacman -Ss xset
world/xorg-xset 1.2.5-1 (xorg-apps xorg)
    User preference utility for X
world/xorg-xsetroot 1.1.3-1 (xorg-apps xorg)
    Classic X utility to set your root window background to a given pattern or color
world/xsettingsd 1.0.2-1
    Provides settings to X11 applications via the XSETTINGS specification
extra/haskell-ixset-typed 0.5.1.0-151
    Efficient relational queries on Haskell sets
extra/xorg-xset 1.2.5-1 (xorg-apps xorg)
    User preference utility for X
extra/xorg-xsetroot 1.1.3-1 (xorg-apps xorg)
    Classic X utility to set your root window background to a given pattern or color
extra/xsettings-client 0.10-9
    Provides cross toolkit configuration settings such as theme parameters
extra/xsettingsd 1.0.2-1
    Provides settings to X11 applications via the XSETTINGS specification
[onyx-dragoon@desktop ~]$ pacman -S xorg-xset
resolving dependencies...
looking for conflicting packages...

Packages (1) xorg-xset-1.2.5-1

Total Download Size:   0.02 MiB
Total Installed Size:  0.04 MiB

:: Proceed with installation? [Y/n]
:: Retrieving packages...
 xorg-xset-1.2.5-1-x86_64                           19.1 KiB  32.3 KiB/s 00:01 [---------------------------------------------] 100%
(1/1) checking keys in keyring                                                 [---------------------------------------------] 100%
(1/1) checking package integrity                                               [---------------------------------------------] 100%
(1/1) loading package files                                                    [---------------------------------------------] 100%
(1/1) checking for file conflicts                                              [---------------------------------------------] 100%
(1/1) checking available disk space                                            [---------------------------------------------] 100%
:: Processing package changes...
(1/1) installing xorg-xset                                                     [---------------------------------------------] 100%
[onyx-dragoon@desktop ~]$ xset r rate 300 50












[onyx-dragoon@desktop ~]$ pacman -Ss tldr
[sudo] password for onyx-dragoon:
world/tldr 3.2.0-3
    Command line client for tldr, a collection of simplified man pages.
extra/tealdeer 1.6.1-1
    A fast tldr client in Rust
extra/tldr 3.2.0-3
    Command line client for tldr, a collection of simplified man pages.








[onyx-dragoon@desktop ~]$ xrandr --output VGA-1 --mode 1920x1200

[onyx-dragoon@desktop ~]$ env | grep -i hist
HISTFILE=/home/onyx-dragoon/.cache/zsh/history
SQLITE_HISTORY=/home/onyx-dragoon/.local/share/sqlite_history
[onyx-dragoon@desktop ~]$ mkdir /home/onyx-dragoon/.cache/zsh
mkdir: cannot create directory ‘/home/onyx-dragoon/.cache/zsh’: File exists
[onyx-dragoon@desktop ~]$ env | grep -i hist
HISTFILE=/home/onyx-dragoon/.cache/zsh/history
SQLITE_HISTORY=/home/onyx-dragoon/.local/share/sqlite_history
[onyx-dragoon@desktop ~]$











[onyx-dragoon@desktop ~]$ pacman -Ss redshift
[sudo] password for onyx-dragoon:
world/redshift 1.12-12
    Adjusts the color temperature of your screen according to your surroundings.
extra/redshift 1.12-12
    Adjusts the color temperature of your screen according to your surroundings.
[onyx-dragoon@desktop ~]$ pacman -S redshift
resolving dependencies...
looking for conflicting packages...

Packages (1) redshift-1.12-12

Total Download Size:   0.14 MiB
Total Installed Size:  0.86 MiB

:: Proceed with installation? [Y/n]
:: Retrieving packages...
 redshift-1.12-12-x86_64                                                            147.6 KiB   199 KiB/s 00:01 [------------------------------------------------------------------] 100%
(1/1) checking keys in keyring                                                                                  [------------------------------------------------------------------] 100%
(1/1) checking package integrity                                                                                [------------------------------------------------------------------] 100%
(1/1) loading package files                                                                                     [------------------------------------------------------------------] 100%
(1/1) checking for file conflicts                                                                               [------------------------------------------------------------------] 100%
(1/1) checking available disk space                                                                             [------------------------------------------------------------------] 100%
:: Processing package changes...
(1/1) installing redshift                                                                                       [------------------------------------------------------------------] 100%
Optional dependencies for redshift
    geoclue: for automatic location based on GeoClue2
    gtk3: for redshift-gtk [installed]
    libappindicator-gtk3: for AppIndicator support in redshift-gtk
    python-gobject: for redshift-gtk [installed]
    python-xdg: for redshift-gtk
:: Running post-transaction hooks...
(1/2) Updating icon theme caches...
(2/2) Updating the desktop file MIME type cache...
[onyx-dragoon@desktop ~]$ redshift -O 5000
Using method `randr'.



https://wiki.archlinux.org/title/VirtualBox/Install_Arch_Linux_as_a_guest

Install the Guest Additions

VirtualBox Guest Additions provides drivers and applications that optimize the guest operating system including improved image resolution and better control of the mouse. Within the installed guest system, install:

    virtualbox-guest-utils for VirtualBox Guest utilities with X support
    virtualbox-guest-utils-nox for VirtualBox Guest utilities without X support


Launch the VirtualBox guest services

After the rather big installation step dealing with VirtualBox kernel modules, now you need to start the guest services. The guest services are actually just a binary executable called VBoxClient which will interact with your X Window System. VBoxClient manages the following features:

    shared clipboard and drag and drop between the host and the guest;
    seamless window mode;
    the guest display is automatically resized according to the size of the guest window;
    checking the VirtualBox host version

All of these features can be enabled independently with their dedicated flags:

$ VBoxClient --clipboard
$ VBoxClient --draganddrop
$ VBoxClient --seamless
$ VBoxClient --checkhostversion
$ VBoxClient --vmsvga












[onyx-dragoon@desktop ~]$ mount -t vboxsf shibbity /home/onyx-dragoon/foobar
[onyx-dragoon@desktop ~]$ mount -t vboxsf shibbity /home/onyx-dragoon/foobar
[onyx-dragoon@desktop ~]$ ls foobar
IISExpress  My Music  My Pictures  My Videos  My Web Sites  Visual Studio 2022  capslock-to-ctrl.reg  desktop.ini
[onyx-dragoon@desktop ~]$



















# VMWare

```
[onyx-dragoon@desktop ~]$ pacman -S open-vm-tools gtkmm3



Note towards the bottom, where VMWare is considered:
https://wiki.archlinux.org/title/VMware/Install_Arch_Linux_as_a_guest
https://askubuntu.com/questions/1308341/dwm-window-manager-on-vmware-player-no-copy-paste-between-host-and-guest


[onyx-dragoon@desktop ~]$ cat .config/x11/xinitrc

#!/bin/sh

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. There is a link to this file in ~/.xprofile
# because that file is run automatically if someone uses a display manager
# (login screen) and so they are needed there. To prevent doubling up commands,
# I source them here with the line below.

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
        . "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
        . "$HOME/.xprofile"
fi

# Activate dbus variables
dbus-update-activation-environment --all
/usr/bin/vmware-user-suid-wrapper &
dbus-launch ssh-agent dwm

```









# History is broken in ZSH

```
mkdir .cache/zsh/
```







# Audio is choppy in VMWare




```

https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Troubleshooting#stuttering-audio-in-virtual-machine

https://www.youtube.com/watch?v=SU584-VRRJw

Stuttering Audio (in Virtual Machine)
Normally this should not happen but is usually caused by jittery drivers. In a VM
this is most common because the device is emulated.
you can usually fix this problem by giving more headroom in the alsa device
ringbuffer.
You need to edit the WirePlumber configuration as follows (since 0.5, the older 0.4 version
uses lua scripts for configuration):

mkdir -p ~/.config/wireplumber/wireplumber.conf.d/
cd ~/.config/wireplumber/wireplumber.conf.d
Then make ~/.config/wireplumber/wireplumber.conf.d/50-alsa-config.conf in an editor and
add:

monitor.alsa.rules = [
  {
    matches = [
      # This matches the value of the 'node.name' property of the node.
      {
        node.name = "~alsa_output.*"
      }
    ]
    actions = {
      # Apply all the desired node specific settings here.
      update-props = {
        api.alsa.period-size   = 1024
        api.alsa.headroom      = 8192
      }
    }
  }
]
Afterwards, restart everything via systemctl --user restart wireplumber pipewire pipewire-pulse
When running inside a VM, also disable the Firefox speech dispatch as
explained here.

```


# Disable Win+L

Yes, it does interfere with Win+L to resize windows to the left in dwm.

https://superuser.com/questions/1059511/how-to-disable-winl-in-windows-10

```
    go to HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, if there is no System, create one
    create a 32bit DWORD, name it DisableLockWorkstation
    set the value of DisableLockWorkstation to 1
    it will take effect immediately
```






















smartctl


[root@desktop ~]$ smartctl -c -d sat /dev/sdd | grep -i remain
[root@desktop ~]$ smartctl -a -d sat /dev/sdd
smartctl 7.4 2023-08-01 r5530 [x86_64-linux-6.10.10-artix1-1] (local build)
Copyright (C) 2002-23, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Family:     Western Digital Gold
Device Model:     WDC WD4002FYYZ-01B7CB0
Serial Number:    K3G5B2RB
LU WWN Device Id: 5 000cca 25cc26f7a


...



SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Extended offline    Completed without error       00%     39612         -
# 2  Short offline       Completed without error       00%     39603         -
# 3  Short offline       Completed without error       00%     39602         -
















# Mesen

[onyx-dragoon@desktop ~]$ yay -S mesen2-git









# Audio debugging, corsair carbide

## Bad Approach
First, we need pulseaudio:
```
[onyx-dragoon@desktop ~]$ pacman -S pulseaudio-bluetooth
```

Then, toggle between headset and speakers:
```
[onyx-dragoon@desktop ~]$ pacmd list-sinks
pacmd set-default-sink 1
pacmd set-default-sink 2
```


[onyx-dragoon@desktop ~]$ pacman -Rns pulseaudio pulseaudio-bluetooth
checking dependencies...
:: libpulse optionally requires pulse-native-provider: PulseAudio backend
:: picom optionally requires rtkit: for realtime scheduling priority
:: pipewire optionally requires rtkit: realtime privileges with rtkit module

Packages (3) rtkit-0.13-3.1  pulseaudio-17.0-3  pulseaudio-bluetooth-17.0-3


## Better approach - use the pulseaudio "plugin" for pipewire

```
pacman -Rns pulseaudio pulseaudio-bluetooth
```

```
pacman -S pipewire-pulse
```


```
[onyx-dragoon@desktop ~]$ pactl list sinks | grep -B1 -A9 -i state
Sink #62
        State: SUSPENDED
        Name: alsa_output.usb-Actions_BW01_0123456789AB-01.analog-stereo
        Description: BW01 Analog Stereo
        Driver: PipeWire
        Sample Specification: s24le 2ch 48000Hz
        Channel Map: front-left,front-right
        Owner Module: 4294967295
        Mute: no
        Volume: front-left: 52516 /  80% / -5.77 dB,   front-right: 52516 /  80% / -5.77 dB
                balance 0.00
--
Sink #66
        State: SUSPENDED
        Name: alsa_output.pci-0000_00_1f.3.analog-stereo
        Description: Built-in Audio Analog Stereo
        Driver: PipeWire
        Sample Specification: s32le 2ch 48000Hz
        Channel Map: front-left,front-right
        Owner Module: 4294967295
        Mute: no
        Volume: front-left: 51738 /  79% / -6.16 dB,   front-right: 51738 /  79% / -6.16 dB
                balance 0.00
--
Sink #102
        State: SUSPENDED
        Name: alsa_output.pci-0000_01_00.1.hdmi-stereo
        Description: GP107GL High Definition Audio Controller Digital Stereo (HDMI)
        Driver: PipeWire
        Sample Specification: s32le 2ch 48000Hz
        Channel Map: front-left,front-right
        Owner Module: 4294967295
        Mute: no
        Volume: front-left: 32112 /  49% / -18.59 dB,   front-right: 32112 /  49% / -18.59 dB
                balance 0.00
```

For me, my headphones are sink 62. My headphones are sink 66. You can use either the ID or the name to switch:

```
pactl set-default-sink 62
pactl set-default-sink 66
```









# Dealing with NVIDIA

Helpful tips: https://forum.artixlinux.org/index.php/topic,7521.0.html

Arch mirrors: https://archlinux.org/mirrorlist/?country=US

Artix Mirrors: https://gitea.artixlinux.org/packages/artix-mirrorlist/raw/branch/master/mirrorlist

Enable these repositories in `/etc/pacman.conf`:
```
[system]
Include = /etc/pacman.d/mirrorlist

[world]
Include = /etc/pacman.d/mirrorlist

[galaxy]
Include = /etc/pacman.d/mirrorlist

[asteroids]
Include = /etc/pacman.d/mirrorlist

[lib32]
Include = /etc/pacman.d/mirrorlist

[community]
Include = /etc/pacman.d/mirrorlist-multilib

[multilib]
Include = /etc/pacman.d/mirrorlist-multilib
```

Ensure mirrorlist refers to artix:

```
[root@desktop ~]$ rm -f /var/lib/pacman/sync/
asteroids.db  community.db  galaxy.db     lib32.db      multilib.db   system.db     world.db
```

as onyx-dragoon:
```
pacman -Syu
pacman -R nvidia nvidia-settings nvidia-utils
pacman -S nvidia-dkms nvidia-settings nvidia-utils
```

DKMS is more reliable for some reason. Try to avoid "gremlins", "extra", and "testing" repositories when dealing with NVIDIA.

















# neovim

1. `rm -rf .config/nvim/`
2.
```
[onyx-dragoon@desktop ~cf/nvim]$ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
3. `~/.config/nvim/lua/theprimeagen/packer.lua`
4. `:so`
5. `:PackerSync`
















   28  sudo pacman -S npm nodejs
   29  sudo pacman -Syu
   30  repams
   31  remaps
   32  sudo pacman -S npm nodejs








helpful in getting the LSP set up.
https://www.youtube.com/watch?v=w7i4amO_zaE&t=1091s
https://github.com/LunarVim/LunarVim/issues/2736#issuecomment-1171080243












# Vagrant

In a Windows environment, from the `.vagrant-in-vbox` folder, copy `Vagrantfile`, `larbs.sh`, and `progs.csv` to the same folder. Then, run `vagrant up`. Now this Linux setup is self-hosted!
















# Font stuff

Well, the plot thickens! Fontconfig definitely sees Inconsolata-g, so the name is correct.

The issue here is likely spacing and format matching. Fontconfig can sometimes reject a font for a generic alias like monospace or mono if it thinks the font doesn't explicitly fit the strict monospace criteria (spacing=100) or if a system-wide rule is overriding your user preference.

Let's bypass the polite request system and explicitly force Fontconfig to use it.
Step 1: Update your fonts.conf with a binding

Instead of a simple <prefer> block, add a explicit <match> block right before your closing </fontconfig> tag. This intercepts requests for mono and monospace and forces Inconsolata-g to the top of the line.

Open your ~/.config/fontconfig/fonts.conf and add this:
XML

<match target="pattern">
        <test qual="any" name="family">
                <string>monospace</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
                <string>Inconsolata-g</string>
        </edit>
</match>

<match target="pattern">
        <test qual="any" name="family">
                <string>mono</string>
        </test>
        <edit name="family" mode="prepend" binding="strong">
                <string>Inconsolata-g</string>
        </edit>
</match>

Using binding="strong" tells Fontconfig to ignore system defaults that might be overriding your alias blocks.
Step 2: Clear cache and test

Run the cache rebuild and test match again:
Bash

fc-cache -fv
fc-match mono
fc-match monospace

If it successfully returns Inconsolata-g, fire up a new st instance and you should be good to go!
