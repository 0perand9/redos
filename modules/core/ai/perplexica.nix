{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.perplexica;
  configFile = pkgs.writeText "config.toml" ''
    [GENERAL]
    PORT = 3001
    SIMILARITY_MEASURE = "cosine" # "cosine" or "dot"

    [API_KEYS]
    OPENAI = "${cfg.openaiKey}"
    GROQ = "${cfg.groqKey}"
    ANTHROPIC = "${cfg.anthropicKey}"

    [API_ENDPOINTS]
    SEARXNG = "http://localhost:4000" # SearxNG API URL
    OLLAMA = "${cfg.ollamaUrl}"
  '';
in
{
  options.services.perplexica = {
    enable = mkEnableOption "Perplexica service";

    port = mkOption {
      type = types.port;
      default = 3420;
      description = "Port to run the service on";
    };

    openaiKey = mkOption {
      type = types.str;
      default = "";
      description = "OpenAI API key";
    };

    ollamaUrl = mkOption {
      type = types.str;
      default = "http://host.docker.internal:11434";
      description = "Ollama API URL";
    };

    groqKey = mkOption {
      type = types.str;
      default = "";
      description = "Groq API key";
    };

    anthropicKey = mkOption {
      type = types.str;
      default = "";
      description = "Anthropic API key";
    };
  };

  config = mkIf cfg.enable {
    virtualisation = {
      docker.enable = true;
      docker.daemon.settings = {
        "dns" = [ "8.8.8.8" ];
      };
    };

    systemd.services.perplexica = {
      description = "Perplexica AI Service";
      wantedBy = [ "multi-user.target" ];
      requires = [ "docker.service" ];
      after = [
        "docker.service"
        "network.target"
      ];

      script = ''
        set -x  # Enable command tracing

        echo "Starting Perplexica service..."

        # Check if Docker is running
        if ! ${pkgs.docker}/bin/docker info > /dev/null 2>&1; then
          echo "Docker is not running"
          exit 1
        fi

        echo "Setting up Perplexica directory..."
        if [ ! -d /var/lib/perplexica ]; then
          echo "Creating directories..."
          mkdir -p /var/lib/perplexica/searxng
          ${pkgs.git}/bin/git clone https://github.com/ItzCrazyKns/Perplexica.git /var/lib/perplexica/repo
          cp -r /var/lib/perplexica/repo/* /var/lib/perplexica/
          rm -rf /var/lib/perplexica/repo
        fi

        echo "Copying config files..."
        cp ${configFile} /var/lib/perplexica/config.toml

        echo "Modifying docker-compose.yaml to use port ${toString cfg.port}..."
        cd /var/lib/perplexica
        ${pkgs.sd}/bin/sd '3000:3000' '${toString cfg.port}:3000' docker-compose.yaml

        echo "Starting Docker Compose..."
        cd /var/lib/perplexica
        ${pkgs.docker-compose}/bin/docker-compose up -d
      '';

      preStop = ''
        cd /var/lib/perplexica
        ${pkgs.docker-compose}/bin/docker-compose down -v
      '';

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };
  };
}
