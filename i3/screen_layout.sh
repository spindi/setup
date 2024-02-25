#!/home/linuxbrew/.linuxbrew/bin/fish
set screen_layout (xrandr | grep ' connected ' | sed -e 's/ .*//' | tr "\n" ' ' | xargs)

echo $screen_layout
switch $screen_layout 
  case "eDP HDMI-A-0"
    echo "HDMI above centre, P14S"
    $HOME/.screenlayout/hdmi_above_centre_p14s.sh
  case "eDP"
    echo "Laptop screen only, P14S"
    $HOME/.screenlayout/laptop_screen_only_p14s.sh
  case "eDP-1 HDMI-1"
    echo "HDMI above centre, X1"
    $HOME/.screenlayout/hdmi_above_centre_x1.sh
  case "eDP-1"
    echo "Laptop screen only, X1"
    $HOME/.screenlayout/laptop_screen_only_x1.sh
end
