# Statusbar loop
#while true; do
#   xsetroot -name "$( date +"%F %R" )"
#   sleep 1m    # Update time every minute
#done &
# Autostart section
#pcmanfm & 
wezterm &
#feh --bg-scale /home/praba/Downloads/illustration-anime-city.jpg &
#picom --experimental-backends &
#picom --config ~/.config/picom/picom.conf &

# Restore wallpaper using Nitrogen
nitrogen --restore &

# Start Picom with the specified configuration
picom --config ~/.config/picom/picom.conf &

# Start DWM
exec /usr/local/bin/dwm


