{
  pkgs,
  lib,
  username,
  ...
}:
{
  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMF.fd ];
        };
      };
    };
  };

  boot = {
    initrd.kernelModules = lib.mkBefore [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
    ];
  };

  environment.systemPackages = with pkgs; [
    looking-glass-client
    spice-vdagent
    virtiofsd
  ];

  systemd.tmpfiles.rules = [ "f /dev/shm/looking-glass 0660 ${username} qemu-libvertd -" ];
}
