{pkgs, ...}:{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_28;
  };
  hardware.nvidia-container-toolkit.enable = true;
}