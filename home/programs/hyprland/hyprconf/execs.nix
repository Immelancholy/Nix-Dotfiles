{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "uwsm app -- hyprctl setcursor Bibata-Modern-Ice 20"
      # "uwsm app -- $scr/swww.sh"
      # "swayidle -w"
      ''uwsm app -- mpvpaper -o "--loop" '*' $HOME/Pictures/wallpapers/Neon-Beast-Girl.mp4''
      "uwsm app -- wl-paste --type text --watch cliphist store # Stores only image data"
      "uwsm app -- wl-paste --type image --watch cliphist store # Stores only image data"
      ''[workspace 1 silent; float; size 858 559; move 640 40] $term --class "rmpc" $scr/rmpc.sh''
      ''[workspace 1 silent; float; size 858 462; move 640 609] $term --class "cava" $scr/cava.sh''
      ''[workspace 1 silent; float; size 620 666; move 10 404] $term --class "btop" $scr/btop.sh''
      ''[workspace 1 silent; float; size 402 1030; move 1508 40] $term --class "neo" $scr/neo.sh''
      ''[workspace 1 silent; float; size 620 354; move 10 40] $term --class "fastfetch" --hold fastfetch --logo $HOME/Pictures/fastfetch_logos/FallenAngel.jpg''
      "[workspace 4 silent] uwsm app -- qpwgraph"
      "[workspace 4 silent] uwsm app -- qpwgraph"
      "[workspace 2 silent] $browser"
      "[workspace 2 silent] uwsm app -- teams-for-linux --minimized"
      "[workspace 3] sleep 1; uwsm app -- DiscordCanary --enable-features=UseOzonePlatform --ozone-platform=x11"
    ];
  };
}
