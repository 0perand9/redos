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
in
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11"
  ];
  programs = {
    virt-manager.enable = true;
    firefox.enable = true;
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
    greetd.tuigreet
    greetd.wlgreet
    wineWowPackages.waylandFull
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

    unstable.zulu25

    unetbootin

    cliphist

    cups
    cups-filters
    system-config-printer

    tealdeer

    unstable.code-cursor

    gsettings-desktop-schemas
    glib

    xorg.libX11
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    xorg.libxcb

    remmina

    jdk17
    javaPackages.openjfx17
    libGL

    inputs.yazi.packages.${pkgs.system}.yazi # TUI FileMgr

    gimp

    unstable.lsfg-vk
    unstable.lsfg-vk-ui
    
    prismlauncher
    mangohud

    #hypr tools
    hyprpicker
  ];
}
