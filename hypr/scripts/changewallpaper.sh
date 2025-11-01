wallpaper=`ls .config/hypr/wallpaper | sort -R | head -n1`
swww img ~/.config/hypr/wallpaper/$wallpaper --transition-type random
unset wallpaper
