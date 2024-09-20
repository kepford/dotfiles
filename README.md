# .Dot files

## Installation

### Fonts

[FiraCodeNerdFont](https://www.nerdfonts.com/font-downloads)

Download the font

Move fonts to `/usr/share/fonts/`

Refresh the system font cache with fc-cache, e.g.:

`fc-cache -v`

### GNU Stow

Run `./stow.sh` to symlink all config

# Linux

## AppImages

Store AppImages in `~/.local/share/applications`

# X

For X there are a few things that must be done.

# Load Theme

Load the catppuccin mocha theme.
`xrdb -merge ~/.dotfiles/x/xresources`

## Natural Scrolling and faster response

Edit the file `/usr/share/X11/xorg.conf.d/40-libinput.conf`

Add the Option "NaturalScrolling" "True" like this:

For your mouse:

```
# Match on all types of devices but joysticks
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```
 
For your touchpad:

```
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```

### Disable middle click

First get a list of the input devices

`xinput list`

Then output the button map for the device. You can use the name or ID number. 

`xinput get-button-map 'PIXA3854:00 093A:0274 Touchpad'`

or

`xinput get-button-map 10`

It likely looks like this

`1 2 3 4 5 6 7`

Middle click is typically `2` change that `1`

`xinput set-button-map 10 1 1 3 4 5 6 7`

Ensure this change is permanent.

`echo "xinput set-button-map 10 1 1 3 4 5 6 7" >> ~/.xinitrc`

[source](https://unix.stackexchange.com/questions/438725/disabling-middle-click-on-bottom-of-a-clickpad-touchpad/553581#553581)

### Set acceleration speed for track pad


`xinput set-prop "device name" "ID" 0.45`

[Source](https://unix.stackexchange.com/questions/391683/how-to-increase-the-acceleration-speed-of-ibm-touchpad-and-trackpoint-in-xubuntu)

List the devices with `xinput list` to find the device name.

Then find the ID for the Accel Speed setting.

Framework has this:

`PIXA3854:00 093A:0274 Touchpad`

`xinput list-props "PIXA3854:00 093A:0274 Touchpad" | grep "Accel Speed"`

        libinput Accel Speed (328):     0.000000
        libinput Accel Speed Default (329):     0.000000

`xinput set-prop "PIXA3854:00 093A:0274 Touchpad" "328" 0.4`

Add this line to `~/.xinputrc` to make permanent. 


Thinkpad has this:

`xinput list-props "Synaptics TM3625-010" | grep "Accel Speed"`

        libinput Accel Speed (332):     0.450000
        libinput Accel Speed Default (333):     0.000000

**Gnome settings**

```
gsettings list-recursively org.gnome.desktop.peripherals.touchpad
org.gnome.desktop.peripherals.touchpad accel-profile 'default'
org.gnome.desktop.peripherals.touchpad click-method 'fingers'
org.gnome.desktop.peripherals.touchpad disable-while-typing true
org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
org.gnome.desktop.peripherals.touchpad left-handed 'mouse'
org.gnome.desktop.peripherals.touchpad middle-click-emulation false
org.gnome.desktop.peripherals.touchpad natural-scroll true
org.gnome.desktop.peripherals.touchpad send-events 'enabled'
org.gnome.desktop.peripherals.touchpad speed 0.43968871595330739
org.gnome.desktop.peripherals.touchpad tap-and-drag true
org.gnome.desktop.peripherals.touchpad tap-and-drag-lock false
org.gnome.desktop.peripherals.touchpad tap-button-map 'default'
org.gnome.desktop.peripherals.touchpad tap-to-click false
org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
```

## i3 Monitor Setup

### Using autorandr

Save the current configuration.

`autorandr --save name`

Load thinkpad only display

`autorandr think`

Load dock profile which disables laptop monitor

`autorandr think-dock`

# Check BIOS version Fedora

Install `lshw` and `dmidecode`

```
sudo dnf install lshw dmidecode -y && sudo dmidecode | grep -A3 'Vendor:\|Product:' && sudo lshw -C cpu | grep -A3 'product:\|vendor:'
```

Run this after install

```
sudo dmidecode | grep -A3 'Vendor:\|Product:' && sudo lshw -C cpu | grep -A3 'product:\|vendor:'
```

list drives:

lsblk

or

df

sudo parted /dev/sda --script -- mklabel msdos
sudo parted /dev/sda --script -- mkpart primary fat32 1MiB 100%
sudo mkfs.vfat -F32 /dev/sda1
sudo parted /dev/sda --script print
