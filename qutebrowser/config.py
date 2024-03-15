import catppuccin

# user agent
# previous user agent
# Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}
# suggested user agent
# Mozilla/5.0 (X11; Linux x86_64; rv:57.0) Gecko/20100101 Firefox/77.1

config.load_autoconfig()

c.auto_save.session = True

c.fonts.default_size = "16px"
c.zoom.default = "150%"

c.content.cache.size = 268435456
# c.content.cache.maximum_pages = 24

# set the flavor you'd like to use
# valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
# last argument (optional, default is False): enable the plain look for the menu rows
catppuccin.setup(c, 'mocha', False)

# shortcuts
config.bind("<Alt-Left>", "back")
config.bind("<Alt-Right>", "forward")
config.bind("<Alt-Up>", "tab-next")
config.bind("<Alt-Down>", "tab-prev")
config.bind('<Ctrl-=>', 'zoom-in')
config.bind('<Ctrl-->', 'zoom-out')
