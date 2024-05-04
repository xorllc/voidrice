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
