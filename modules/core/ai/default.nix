{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  environment.variables = lib.mkForce {
    VLLM_TARGET_DEVICE = "cuda";
    CUDA_HOME = "${pkgs.cudaPackages.cuda_nvcc}";
    LD_LIBRARY_PATH = "${pkgs.cudatoolkit}/lib:${pkgs.cudaPackages.cuda_cudart}/lib";
  };
  environment.systemPackages = with pkgs; [
    unstable.ollama
    unstable.vllm
  ];

  # Ollama configuration
  services.ollama = {
    enable = true;
    package = unstable.ollama;
    acceleration = "cuda";
  };
  systemd.services.ollama.serviceConfig = {
    Environment = "OLLAMA_HOST=0.0.0.0";
  };

  services.open-webui = {
    enable = true;
    # package = unstable.open-webui;
  };

  services.perplexica = {
    enable = true;
    ollamaUrl = "http://localhost:11434";
  };

  imports = [ ./perplexica.nix ];
}
