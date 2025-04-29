{ pkgs, ... }:
{
  # nixpkgs.overlays = [
  #   (self: super: {
  #     discord = super.discord.overrideAttrs (_: {
  #       src = builtins.fetchTarball {
  #         url = "https://discord.com/api/download?platform=linux&format=tar.gz";
  #         sha256 = "sha256:07h735lzx70ghrddv0krahm1sqjcxx52wlpy7fsi17gqxix1mbrr";
  #       };
  #     });
  #   })
  # ];
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
  ];
}
