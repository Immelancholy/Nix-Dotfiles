{
  pkgs,
  lib,
  scriptBin,
  ...
}: {
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
    EDITOR = "${./programs/scripts/nv.sh}";
    BROWSER = "zen";
    TERMINAL = "${lib.getExe pkgs.kitty}";
    # NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
    ENABLE_VKBASALT = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
    GDK_SCALE = "1";
    GRIMBLAST_EDITOR = "swappy";
    MPD_HOST = "/run/user/1000/mpd/socket";
    MANGOHUD = "1";
  };
}
