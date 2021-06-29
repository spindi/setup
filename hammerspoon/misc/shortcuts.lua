--- quick open applications
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

hs.hotkey.bind(bind_keys, "c", open("Google Chrome"))
hs.hotkey.bind(bind_keys, "f", open("Finder"))
-- hs.hotkey.bind(bind_keys, "k", open("kitty"))
hs.hotkey.bind(bind_keys, "i", open("iTerm"))
--- hs.hotkey.bind(bind_keys, "m", open("spotify"))
hs.hotkey.bind(bind_keys, "s", open("Stickies"))
-- hs.hotkey.bind(bind_keys, "t", open("terminal"))
