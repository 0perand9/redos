{ lib, host, ... }:
let

  inherit (import ../../../hosts/${host}/variables.nix) gpu-bypass;
in
{ # TODO support intel
  boot = lib.mkIf gpu-bypass.enable {
    kernelParams = lib.mkBefore [
      "amd_iommu=on"
      "iommu=pt"
      "vfio-pci.ids=${lib.concatStringsSep "," gpu-bypass.gpuIds}"
      "fbcon=map:1" # This explicitly maps console to first framebuffer
      "console=tty1"
      "video.keep_system_framebuffer=1" # This prevents VFIO from claiming the framebuffer
    ];
  };
}
