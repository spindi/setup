--- quick open applications
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

mash = { 'ctrl', 'alt', 'cmd' }
hs.hotkey.bind(mash, "e", open("Finder"))
hs.hotkey.bind(mash, "t", open("Terminal"))
