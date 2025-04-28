{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.drivers.nvidia;
in
{
  options.drivers.nvidia = {
    enable = mkEnableOption "Enable Nvidia Drivers";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    boot.initrd.kernelModules = lib.mkAfter [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
      "uinput"
    ];

    boot.kernelParams = [
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=0"
    ];

    hardware = {
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          vaapiVdpau
          vulkan-validation-layers
          nvidia-vaapi-driver
        ];
      };

      nvidia = {
        modesetting.enable = true;

        powerManagement.enable = false;
        powerManagement.finegrained = false;

        open = false;
        nvidiaSettings = true;

        # preferring my main gpu
        prime = {
          sync.enable = true;
          nvidiaBusId = "PCI:10:0:0";
          intelBusId = "PCI:4:0:0";
        };

        package = config.boot.kernelPackages.nvidiaPackages.latest;

      };
    };

    console = {
      earlySetup = true;
      keyMap = "us";
    };
  };
}
