{
  config,
  pkgs,
  lib,
  ...
}:
let
  additionalJDKs = with pkgs; [
    openjdk8
    zulu8
    jdk8
    openjdk11
    
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
    javaPackages.openjfx21

    kdePackages.kalarm

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

    nodejs_18
    nodePackages.vercel

    python311
    python311Packages.requests
    python311Packages.rich

    bytecode-viewer
  ];
}
