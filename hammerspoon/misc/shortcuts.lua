--- quick open applications
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

hs.hotkey.bind(bind_keys, "e", open("Finder"))
hs.hotkey.bind(bind_keys, "t", open("Terminal"))
