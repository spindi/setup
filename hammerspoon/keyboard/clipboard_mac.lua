hs.hotkey.bind({"alt"}, "a", nil, function() hs.eventtap.keyStroke({"cmd"}, "a") end)
hs.hotkey.bind({"alt"}, "c", nil, function() hs.eventtap.keyStroke({"cmd"}, "c") end)
hs.hotkey.bind({"alt"}, "v", nil, function() hs.eventtap.keyStroke({"cmd"}, "v") end)
hs.hotkey.bind({"alt"}, "x", nil, function() hs.eventtap.keyStroke({"cmd"}, "x") end)
-- Without the following the text would not end up in the clipboard
hs.hotkey.bind({"rightshift"}, "forwarddelete", nil, function() hs.eventtap.keyStroke({"cmd"}, "x") end)
