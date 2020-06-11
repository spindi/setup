--- quick open applications
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

hs.hotkey.bind(bind_keys, "f", open("Finder"))
hs.hotkey.bind(bind_keys, "k", open("kitty"))
hs.hotkey.bind(bind_keys, "m", open("Spotify"))
hs.hotkey.bind(bind_keys, "p", open("Stickies")) --- postit
hs.hotkey.bind(bind_keys, "s", open("Safari"))
hs.hotkey.bind(bind_keys, "t", open("Terminal"))
