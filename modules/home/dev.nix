{
  config,
  pkgs,
  lib,
  ...
}:
let
  additionalJDKs = with pkgs; [
    openjdk8
    openjdk11

    jdk8

    zulu11
    zulu25

    (zulu17.override { enableJavaFX = true; })
    (zulu8.override { enableJavaFX = true; })
    (jdk17.override { enableJavaFX = true; })
    (jdk21.override { enableJavaFX = true; })
  ];
in
{
  home.sessionPath = [ "$HOME/.jdks" ];
  home.file = (
    builtins.listToAttrs (
      builtins.map (jdk: {
        name = ".jdks/${jdk.version}";
        value = {
          source = jdk;
        };
      }) additionalJDKs
    )
  );

  home.packages = with pkgs; [
    nss
    nspr

    cmake
    ninja
    direnv
    nix-direnv

    kdePackages.kalarm

    gitui

    ydotool

    postgresql

    nixfmt-rfc-style

    recaf-launcher

    jetbrains-toolbox

    cargo
    gcc

    openjfx
    gtk3

    gh
    docker_28
    maven

    makemkv
    ffmpeg
    mkvtoolnix

    chromium
    # chromedriver-op

    xorg.libXxf86vm # required native library for JavaFXD

    ghidra

    # jdk11

    nodejs_22
    nodePackages.vercel

    digital

    python311
    python311Packages.requests
    python311Packages.rich
    python311Packages.pip

    bytecode-viewer
  ];
}
