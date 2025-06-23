{ inputs, ... }:
{
  imports = [
    ./virtualisation
    ./packages.nix
    ./boot.nix
    ./discord.nix #maybe move to home
    ./system.nix
    ./hardware.nix
    ./greetd.nix
    ./starfish.nix
    ./services.nix
    ./networking.nix
    ./arr-proxy.nix
    ./user.nix
    ./printing.nix
    ./postgresql.nix
    ./stylix.nix
    ./steam.nix
    ./fonts.nix
    ./xdg.nix
    ./emulation.nix

    ./ai
    inputs.stylix.nixosModules.stylix
  ];

  # TODO remove these once we add our new ones!
  # services.xserver.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;
}
