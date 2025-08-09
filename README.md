# .Dot files

## Installation


### Fonts

[FiraCodeNerdFont](https://www.nerdfonts.com/font-downloads)

Download the font

Move fonts to `/usr/share/fonts/`

Refresh the system font cache with fc-cache, e.g.:

`fc-cache -v`

### Install NVM (Node Version Manager, its needed for Neovim plugins)

Change the version number

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash`

Install a node version.

`nvm install v22.15.1`

### Git

Create local git config

`printf '%s\n' '[user]' '  email = bob@bobkepford.com' '  name = kepford' > .gitconfig_local`

#### Optional extra steps (on new hosts)

1. Generate ssh keys:

```sh
ssh-keygen -t ed25519
```

2. Import gpg keys:

```sh
gpg --import <key>.gpg
gpg --edit-key <key-id>
# trust, 5, save
```

### Bash Local

Create local bash config

`touch ~/.bash_local`

### Clipboard vim config

@TODO Doesn't work in Arch

### Tmux 

Download tmux plugin-manager

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

In Tmux you must do the following:

Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

#### Catppuccin Theme Plugin

```
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

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

List your touchpad settings

```
gsettings list-recursively org.gnome.desktop.peripherals.touchpad
```

Set them if needed

```
gsettings set org.gnome.desktop.peripherals.touchpad accel-profile 'default'
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
gsettings set org.gnome.desktop.peripherals.touchpad left-handed 'mouse'
gsettings set org.gnome.desktop.peripherals.touchpad middle-click-emulation false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.43968871595330739
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag-lock false
gsettings set org.gnome.desktop.peripherals.touchpad tap-button-map 'default'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
```

## i3 Monitor Setup

List the active monitors

`xrandr --listactivemonitors`

Setting up output of monitors

`xrandr --output DP-2 --auto --left-of eDP-1`

### Load Presets Using autorandr

Save the current configuration.

`autorandr --save name`

Load work thinkpad only display

`autorandr think`

Load dock profile which disables laptop monitor and works with home dock.

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

## Fedora Firmware Updates

1. Fetch firmware updates 

`sudo fwupdmgr refresh`

This command will refresh the LVFS and check for available firmware updates for your system. 

2. View available updates:

`fwupdmgr get-updates`

This command will display a list of available firmware updates. 

3. Install updates:

`sudo fwupdmgr update`

## Tips

Neofetch replacement :)

`cat /proc/cpuinfo`
`cat /proc/meminfo`
`cat /etc/osrelease`
`uname -a`
