-- bind keys
bind_keys = { 'ctrl', 'alt', 'cmd' }

-- reload hammerspoon configs
hs.hotkey.bind(bind_keys, 'r', function()
  hs.reload()
end)
hs.alert.show("Config reloaded")

-- require("misc.clipboard")
require("misc.caffiene")
require("misc.shortcuts")
require("window.manipulation")
-- require("keyboard.remap")
require("keyboard.clipboard_mac")
require("keyboard.windows_snip")
require("keyboard.windows_lock")
-- require("mouse.middle_scroll")
