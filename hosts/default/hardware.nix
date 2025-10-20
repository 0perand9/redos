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
  
  age.identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  
  age.secrets.truenas-creds = {
    file = ../../secrets/truenas-creds.age; # Adjust path as needed
    mode = "600";
  };
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  systemd.mounts = [{
    what = "//192.168.1.99/file_shared";
    where = "/mnt/truenas";
    type = "cifs";
    options = "credentials=${config.age.secrets.truenas-creds.path},uid=1000,gid=100,file_mode=0777,dir_mode=0777,vers=2.1";
  }];

  systemd.automounts = [{
    where = "/mnt/truenas";
    wantedBy = [ "multi-user.target" ];
  }];


  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.virbr0.useDHCP = lib.mkDefault true;
  # networking.interfaces.vnet1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
