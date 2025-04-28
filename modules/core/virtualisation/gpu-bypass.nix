{ lib, host, ... }:
let

  inherit (import ../../../hosts/${host}/variables.nix) gpu-bypass;
in
{
  boot = lib.mkIf gpu-bypass.enable {
    kernelParams = lib.mkBefore [
      "amd_iommu=on"
      "iommu=pt"
      "vfio-pci.ids=${lib.concatStringsSep "," gpu-bypass.gpuIds}"
      "console=tty1"
    ];
  };
}
