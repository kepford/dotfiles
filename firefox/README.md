# Firefox Customization

1. Create a symlink to you FF profile folder and the chrome directory.
  - `cd` to your FF profile (you can find the path here `about:support`)
  - `ln -s /Users/bkepford/bin/dotfiles/firefox/chrome chrome`
2. Open FF and go to `about:config` and search for `toolkit.legacyUserProfileCustomizations.stylesheets` and set to `true`


Many snippets here:
https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#for-userchromecss
