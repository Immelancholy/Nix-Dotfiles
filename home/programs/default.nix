{ pkgs, inputs, ... }: {
  imports = [
    ./hyprland
    ./waybar
    ./yazi.nix
    ./mpd
    ./cava
    ./fastfetch
    ./nvim
  ];
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      font_family = "CaskaydiaCove Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = false;
      font_size = 9.5;
      window_padding_width = 15;
      allow_remote_control = true;
      listen_on = "unix:kitty";
    };
  };

  programs.btop = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      vim_keys = true;
    };
  };

  services.remmina = {
    enable = true;
    addRdpMimeTypeAssoc = true;
  };
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".beta

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    neo

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
    xfce.exo
    xfce.xfce4-settings
    rmpc
    mpd
    protonup
    mpdris2
    playerctl
    pokemonsay
    fortune
    cowsay
    lz4
    easyeffects
    qpwgraph
    ark
    parted
    teams-for-linux
    retroarch-free
    qalculate-gtk
    libreoffice
    fd

  ];
  
  programs.zoxide = {
    enable = true;
  };
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Immelancholy";
    userEmail = "lenalowes0@gmail.com";
  };
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "/home/mela/.steam/root/compatibilitytools.d";
    EDITOR = 
      "/home/mela/.local/share/bin/kitty_nvim.sh";
    XDG_SCREENSHOTS_DIR = 
      "$HOME/Pictures/screenshots";
  };
}
