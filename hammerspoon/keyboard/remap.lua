hs.hotkey.bind({"shift"}, "§", function()
   hs.eventtap.keystroke({"shift"}, "`")
end)
hs.hotkey.bind({"ctrl"}, "§", function()
   hs.eventtap.keystroke({"shift"}, "\\")
end)
hs.hotkey.bind({}, "§", function()
   hs.eventtap.keystroke({}, "escape")
end)
