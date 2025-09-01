{pkgs, ...}:{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_28;
    daemon.settings = {
      dns = [ "10.64.0.1" "8.8.8.8" ];
    };
  };
  hardware.nvidia-container-toolkit.enable = true;
}