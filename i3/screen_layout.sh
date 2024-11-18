#!/home/linuxbrew/.linuxbrew/bin/fish
set screen_layout (xrandr | grep ' connected ' | sed -e 's/ .*//' | tr "\n" ' ' | xargs)

echo $screen_layout
switch $screen_layout 
  case "eDP DisplayPort-5"
    echo "HDMI above centre - beside Ebe - Hardcore desk, P14S"
    $HOME/.screenlayout/hdmi_above_centre_p14s_beside_ebe_hardcore_desk_dp5.sh
  case "eDP DisplayPort-4"
    echo "HDMI above centre - beside Ebe - Hardcore desk, P14S"
    $HOME/.screenlayout/hdmi_above_centre_p14s_beside_ebe_hardcore_desk.sh
  case "eDP DisplayPort-2 DisplayPort-3"
    echo "HDMI above centre and left - Margot's desk, P14S"
    $HOME/.screenlayout/hdmi_above_and_left_p14s_margot.sh
  case "eDP HDMI-A-0"
    echo "HDMI above centre, P14S"
    $HOME/.screenlayout/hdmi_above_centre_p14s.sh
  case "eDP DisplayPort-0"
    echo "HDMI above centre, P14S"
    $HOME/.screenlayout/displayport_above_centre_p14s.sh
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
