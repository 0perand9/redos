{ config, pkgs, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  environment.systemPackages = with pkgs; [ unstable.ollama ];

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
    ollamaUrl = "http://192.168.1.210:11434";
  };

  imports = [ ./perplexica.nix ];
}
