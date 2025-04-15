{
  config,
  pkgs,
  lib,
  ...
}:
let
  additionalJDKs = with pkgs; [
    openjdk11
    zulu8
    openjdk8
    jdk8
    (jdk17.override { enableJavaFX = true; })
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

    openjfx # provides JavaFX libraries
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
