{
  scriptBin,
  hyprMonitor,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    "$scr" = "${scriptBin}";
    "$term" = "uwsm app -- kitty";
    "$files" = "uwsm app -- nemo";
    "$filest" = "$term uwsm app -- yazi";
    "$mod" = "SUPER";
    "$mods" = "SUPERSHIFT";
    "$menu" = ''rofi -show drun -run-command "uwsm-app -- {cmd}" run filebrowser power-menu -modi drun,run,filebrowser,power-menu:rofi-power-menu'';
    "$browser" = "uwsm app -- zen";
    "$edit" = "$term uwsm app -- $scr/nv.sh";
    "$player" = "mpd";
    "$playerctl" = "uwsm app -- playerctl --player=$player";
    monitor = "${hyprMonitor}";
    input = {
      kb_layout = "gb";
      kb_options = "fkeys:basic_13-24";
      follow_mouse = "1";

      sensitivity = "0";
      force_no_accel = "1";
      numlock_by_default = "true";
    };
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      key_press_enables_dpms = true;
      vfr = true;
    };
    dwindle = {
      pseudotile = true;
      preserve_split = true;
      # smart_split = true;
    };
  };

  imports = [
    ./binds.nix
    ./theme
    ./execs.nix
    ./windowrules.nix
    ./plugins
  ];
}
