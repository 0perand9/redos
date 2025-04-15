{pkgs,...}:{
  environment.systemPackages = with pkgs; [
    # bcachefs-tools
    # trezor-suite
    # pciutils
    # usbutils
    # flameshot
    # rar
    # p7zip
    # runelite
    # mangohud
    # dmidecode
    # remmina
    # gimp-with-plugins
    # gdu
    # vlc
    # lutris
    # bc
    # wineWow64Packages.full

    # xorg.libX11
    # xorg.libXext
    # xorg.libXrender
    # xorg.libXtst
    # xorg.libXi

    # headsetcontrol

    # kiwix
    # kiwix-tools

    # gcc
    # libgcc
    # gnumake
    # cmake
    # extra-cmake-modules

    # steamcmd
    # lvm2

    # (discord.override {
    #   withOpenASAR = true;
    #   withVencord = true;
    # })
  ];
}