{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
      inputs.hyprland-plugins.packages.${pkgs.system}.xtra-dispatchers
    ];
    systemd = {
      # disable the systemd integration, as it conflicts with uwsm.
      enable = false;
      variables = ["--all"];
    };
  };

  services.hyprpolkitagent.enable = true;

  programs.swaylock = {
    enable = true;
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTargets = ["graphical-session.target"];
  };

  services.udiskie = {
    enable = true;
    notify = true;
    tray = "always";
    automount = true;
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        enable_posix_regex = true;
        frame_color = "#cba6f7c0";
        separator_color = "frame";
        highlight = "#89b4fac0";
        frame_width = 2;
        corner_radius = 15;
        origin = "top-right";
        offset = "(54, 18)";
        width = "(0, 400)";
        max_icon_size = 64;
        font = "JetBrainsMono Nerd Font Mono 9";
      };
      urgency_low = {
        background = "#1e1e2e99";
        foreground = "#cdd6f4";
      };
      urgency_normal = {
        background = "#1e1e2e99";
        foreground = "#cdd6f4";
      };
      urgency_critical = {
        background = "#1e1e2e99";
        foreground = "#cdd6f4";
        frame_color = "#fab387c0";
      };
    };
  };

  imports = [
    ./hyprconf
  ];
}
