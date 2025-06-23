{ profile, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      # Alt+h,j,k,l for navigation
      bindkey "\eh" backward-word
      bindkey "\ej" down-line-or-history
      bindkey "\ek" up-line-or-history
      bindkey "\el" forward-word

      # Word deletion
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word

      # Home and End keys
      bindkey '\e[H' beginning-of-line
      bindkey '\e[F' end-of-line
      bindkey '\e[1~' beginning-of-line
      bindkey '\e[4~' end-of-line
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line

      # Delete key
      bindkey '\e[3~' delete-char

      # PageUp and PageDown
      bindkey '\e[5~' up-line-or-history
      bindkey '\e[6~' down-line-or-history

      # Ctrl+left and Ctrl+right for word navigation
      bindkey '\e[1;5D' backward-word
      bindkey '\e[1;5C' forward-word

      # Ctrl+U to clear line before cursor
      bindkey '^U' backward-kill-line

      # Ctrl+K to clear line after cursor
      bindkey '^K' kill-line

      # Ctrl+W to delete word backward
      bindkey '^W' backward-kill-word

      # Ctrl+L to clear screen
      bindkey -s '^L' 'clear\n'

      if [ -f $HOME/.zshrc-personal ]; then
         source $HOME/.zshrc-personal
      fi
    '';

    shellAliases = {
      sv = "sudo nvim";
      v = "nvim";
      c = "clear";
      fr = "nh os switch --hostname ${profile}";
      fu = "nh os switch --hostname ${profile} --update";
      rr = "sudo nixos-rebuild switch --flake ~/redos/.#nvidia";
      er = "code ~/redos/";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      ls = "eza --icons --group-directories-first -1";
      ll = "eza --icons -lh --group-directories-first -1 --no-user --long";
      la = "eza --icons -lah --group-directories-first -1";
      tree = "eza --icons --tree --group-directories-first";
      nix-shell = "nix-shell --command zsh";
      looking-glass-client = "__NV_DISABLE_EXPLICIT_SYNC=1 looking-glass-client";
    };
  };
}
