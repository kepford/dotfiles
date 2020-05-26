-- Modified from https://gist.github.com/ttscoff/cce98a711b5476166792d5e6f1ac5907

-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- Trigger existing hyper key shortcuts

k:bind({}, 'm', nil, function() hs.eventtap.keyStroke({"cmd","alt","shift","ctrl"}, 'm') end)

-- OR build your own

launch = function(appname)
  hs.application.launchOrFocus(appname)
  k.triggered = true
end

-- Single keybinding for app launch
singleapps = {
  {'q', 'MailMate'},
  {'w', 'OmniFocus'},
  {'f', 'Firefox'},
  {'s', 'Slack'},
  {'t', 'iTerm'},
  {'c', 'Fantastical'},
  {'z', 'zoom.us'}
}

for i, app in ipairs(singleapps) do
  k:bind({}, app[1], function() launch(app[2]); k:exit(); end)
end

-- Sequential keybindings, e.g. Hyper-a,f for Finder
a = hs.hotkey.modal.new({}, "F16")
apps = {
  {'t', 'iTerm'},
  {'f', 'Finder'},
}
for i, app in ipairs(apps) do
  a:bind({}, app[1], function() launch(app[2]); a:exit(); end)
end

pressedA = function() a:enter() end
releasedA = function() end
k:bind({}, 'a', nil, pressedA, releasedA)

-- Shortcut to reload config

ofun = function()
  hs.reload()
  hs.alert.show("Config loaded")
  k.triggered = true
end
k:bind({}, 'o', nil, ofun)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

-- HYPER+L: Open news.google.com in the default browser
-- lfun = function()
--   news = "app = Application.currentApplication(); app.includeStandardAdditions = true; app.doShellScript('open http://news.google.com')"
--   hs.osascript.javascript(news)
--   k.triggered = true
-- end
-- k:bind('', 'l', nil, lfun)
