{ pkgs, ... }:
{
  # Services to start
  services = {
    trezord.enable = true; # Enable Trezor crypto currency wallet
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview
    gnome.gnome-keyring.enable = true;
    smartd = {
      enable = true; # this cannot be enabled if on a vm
      autodetect = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    roon-server = {
      enable = true;
      openFirewall = true;
    };
    roon-bridge = {
      enable = true;
      openFirewall = true;
    };
    # Enable SSH
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        KbdInteractiveAuthentication = true;
        PermitRootLogin = "no";
      };
    };
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
