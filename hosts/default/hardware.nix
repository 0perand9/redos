{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  age.secrets.truenas-creds = {
    file = ../../secrets/truenas-creds.age;  # Adjust path as needed
    mode = "600";
  };
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  fileSystems."/mnt/truenas" = {
   device = "//192.168.1.99/file_shared";
   fsType = "cifs";
    options = [
      "credentials=${config.age.secrets.truenas-creds.path}"
      "uid=3000"
      "gid=3000"  # users group
      "iocharset=utf8"
      "file_mode=0777"
      "dir_mode=0777"
      "vers=3.0"
    ];
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.virbr0.useDHCP = lib.mkDefault true;
  # networking.interfaces.vnet1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
