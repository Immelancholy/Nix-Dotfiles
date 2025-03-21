{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = [
    pkgs.nvtopPackages.full # nvtop
    pkgs.mesa-demos
    pkgs.vulkan-tools
    pkgs.libva-utils
    pkgs.vdpauinfo
    pkgs.vulkan-validation-layers
    pkgs.egl-wayland
  ];
  boot.blacklistedKernelModules = ["nouveau"];

  nixpkgs.config.cudaSupport = true;

  environment.variables = {
    # Required to run the correct GBM backend for nvidia GPUs on wayland
    GBM_BACKEND = "nvidia-drm";
    # Apparently, without this nouveau may attempt to be used instead
    # (despite it being blacklisted)
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Hardware cursors are currently broken on wlroots
    WLR_NO_HARDWARE_CURSORS = "1";
    NVD_BACKEND = "direct";
    LIBVA_DRIVER_NAME = "nvidia";
    AQ_TRACE = "1";
    AQ_DRM_DEVICES = "/dev/dri/card0";
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      libva-vdpau-driver
    ];
  };

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.

    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
