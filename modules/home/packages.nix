{
  config,
  pkgs,
  lib,
  ...
}:{
  home.packages = with pkgs; [
    trezor-suite
  ];
}