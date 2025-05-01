{ pkgs, inputs, ... }:
{
  programs = {
    virt-manager.enable = true;
    firefox.enable = true;
  };
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman # For removable media support
    gnome.file-roller # Archive backend for thunar-archive-plugin

    amfora # Fancy Terminal Browser For Gemini Protocol
    pavucontrol # For Editing Audio Levels & Devices
    postgresql
    greetd.tuigreet
    greetd.wlgreet
    wineWowPackages.waylandFull
    winetricks
    clipse
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
  ];
}
