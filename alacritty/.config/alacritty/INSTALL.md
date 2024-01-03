Source: https://clubmate.fi/alacritty
Test if you got terminfo installed:

$ `infocmp alacritty`

Clone Alacritty because we need bits from it, and hop into the dir:

$ `git clone https://github.com/alacritty/alacritty.git`
$ `cd alacritty`

Then setup terminfo:

$ `sudo tic -xe alacritty,alacritty-direct extra/alacritty.info`
