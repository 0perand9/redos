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
    temurin-bin-24

    zulu11

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

    kdePackages.kalarm

    gitui

    postgresql

    vscode
    nixfmt-rfc-style

    recaf-launcher

    jetbrains.idea-ultimate
    jetbrains.rust-rover
    jetbrains.datagrip

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

    python311
    python311Packages.requests
    python311Packages.rich
    python311Packages.pip

    bytecode-viewer
  ];
}
