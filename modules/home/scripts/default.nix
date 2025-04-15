{
  pkgs,
  username,
  ...
}:
{
  home.packages = [
    (import ./rofi-launcher.nix { inherit pkgs; })
    (import ./squirtle.nix { inherit pkgs; })
    (import ./keybinds.nix { inherit pkgs; })
    (import ./wallsetter.nix { inherit pkgs; })
    (import ./screenshootin.nix { inherit pkgs; })
  ];
}
