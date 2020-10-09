-- https://github.com/evantravers/hammerspoon-config
config = {}
config.applications = {
  ['Alfred'] = {
    bundleID = 'com.runningwithcrayons.Alfred',
    local_bindings = {'s', 'space', 's'}
  },
  ['Jumpcut'] = {
    bundleID = 'net.sf.Jumpcut',
    local_bindings = {',', '\\'}
  },
  ['Brave'] = {
    bundleID = 'com.brave.browser',
    hyper_key = 'b',
    preferred_display = 1
  },
  ['Firefox'] = {
    bundleID = 'org.mozilla.firefox',
    hyper_key = 'k',
    preferred_display = 1
  },
  ['Dash'] = {
    bundleID = 'com.kapeli.dashdoc',
    hyper_key = 'h',
    tags = {'#coding'}
  },
  ['iTerm'] = {
    bundleID = 'com.googlecode.iterm2',
    hyper_key = 't',
    preferred_display = 2
  },
  ['Fantastical'] = {
    bundleID = 'com.flexibits.fantastical2.mac',
    hyper_key = 'c',
    local_bindings = {']'},
    tags = {'#planning', '#review', '#calendar'},
    preferred_display = 2,
  },
  ['Finder'] = {
    bundleID = 'com.apple.finder',
    hyper_key = 'f'
  },
  ['Drafts'] = {
    bundleID = 'com.agiletortoise.Drafts-OSX',
    hyper_key ='d',
    tags = {'#review', '#writing', '#research'},
    local_bindings = {'x', ';'}
  },
  ['OmniFocus'] = {
    bundleID = 'com.omnigroup.OmniFocus3.MacAppStore',
    tags = {'#planning'},
    hyper_key = 'w',
    preferred_display = 1
  },
  ['MailMate'] = {
    bundleID = 'com.freron.MailMate',
    hyper_key = 'q',
    tags = {'#communication'}
  }
}

hyper = require('hyper')
hyper.start(config)

local brave = require('brave')
      brave.start(config)
