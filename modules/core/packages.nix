{
  pkgs,
  inputs,
  config,
  ...
}:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
  wine = pkgs.wineWowPackages.waylandFull.override {
    waylandSupport = true;
    x11Support = true;
    vulkanSupport = true;
  };
in
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11"
  ];
  programs = {
    xwayland.enable = true;
    virt-manager.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman # For removable media support
    file-roller # Archive backend for thunar-archive-plugin

    amfora # Fancy Terminal Browser For Gemini Protocol
    pavucontrol # For Editing Audio Levels & Devices
    postgresql
    tuigreet

    inputs.zen-browser.packages."${pkgs.system}".default

    protonup-qt

    wireshark

    devenv

    wine
    winetricks
    # clipse
    lutris
    eza
    rar
    zip
    unrar
    unzip
    neovim
    pciutils
    usbutils
    vlc
    wget

    unetbootin

    cliphist

    cups
    cups-filters
    system-config-printer

    tealdeer

    unstable.opencode
    unstable.code-cursor

    gsettings-desktop-schemas
    glib

    xorg.libX11
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    xorg.libxcb

    remmina

    libGL

    # inputs.yazi.packages.${pkgs.system}.yazi # TUI FileMgr

    gimp

    unstable.lsfg-vk
    unstable.lsfg-vk-ui

    prismlauncher
    mangohud

    #hypr tools
    hyprpicker
  ];
}
