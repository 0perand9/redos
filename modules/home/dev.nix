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
    zulu8
    jdk8

    zulu11

    javaPackages.openjfx21
    javaPackages.openjfx17

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
    kdePackages.kalarm

    gitui

    postgresql

    vscode
    nixfmt-rfc-style

    jetbrains.idea-ultimate
    # jetbrains.rust-roverCache
    jetbrains.datagrip

    gh
    docker
    maven

    makemkv
    ffmpeg
    mkvtoolnix

    chromium
    # chromedriver-op

    xorg.libXxf86vm # required native library for JavaFX

    ghidra

    # jdk11

    nodejs_22
    nodePackages.vercel

    python311
    python311Packages.requests
    python311Packages.rich

    bytecode-viewer
  ];
}
