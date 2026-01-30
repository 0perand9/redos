{pkgs, ...}:{
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    dns = ["10.64.0.1"];
  };
  hardware.nvidia-container-toolkit.enable = true;
}