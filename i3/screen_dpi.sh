#!/home/linuxbrew/.linuxbrew/bin/fish/bin/fish
for i in 1 2
    xrandr --fbmm (xrandr | sed -n '/ connected / {s/.* \([0-9]\+\)mm x \([0-9]\+\)mm/\1x\2/p;q}')
end
