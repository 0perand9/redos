{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      discord = super.discord.overrideAttrs (_: {
        src = builtins.fetchTarball {
          url = "https://discord.com/api/download?platform=linux&format=tar.gz";
          sha256 = "sha256:1mc4qxx8wc46cxzxjlydwp18v29biqfb8bnh39insphdqql2pkq8";
        };
      });
    })
  ];
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
  ];
}
