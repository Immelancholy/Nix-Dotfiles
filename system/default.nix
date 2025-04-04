{
  pkgs,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./fonts
    ./programs
    ./extracache.nix
    ./env.nix
  ];
  services.gnome.gnome-keyring = {
    enable = true;
  };
  programs.seahorse.enable = true;

  nixpkgs.config.allowUnfree = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    swapDevices = 1;
    priority = 100;
  };

  security.apparmor = {
    enable = false;
    packages = with pkgs; [
      roddhjav-apparmor-rules
      apparmor-profiles
      apparmor-parser
    ];
  };

  services.solaar.enable = true;

  networking.hostName = "nixos";

  networking.firewall = {
    enable = true;
  };
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  console = {
    earlySetup = true;
    keyMap = "uk";
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "Account for ${user}";
    extraGroups = ["networkmanager" "wheel" "video"];
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    sddm = {
      enable = false;
      flavor = "mocha";
      font = "Noto Sans Nerd Font";
      fontSize = "12";
      background = ../home/backgrounds/anime-girl-wings.jpg;
      loginBackground = true;
    };
  };

  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  xdg.portal = {
    # xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 2d";
  };
  nix.settings.auto-optimise-store = true;
  # ...
  system.stateVersion = "24.05";
}
