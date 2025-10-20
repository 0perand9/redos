{
  description = "RedOs";
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
    stylix.url = "github:danth/stylix/release-25.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    nix-comfyui.url = "github:dyscorv/nix-comfyui";
    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      nix-comfyui,
      nixpkgs-unstable,
      home-manager,
      agenix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      host = "default";
      profile = "nvidia";
      username = "red";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-comfyui.overlays.default ];
      };
    in
    {
      nixosConfigurations.nvidia = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
          unstable = import nixpkgs-unstable {
            inherit system;
            allowUnfree = true;
          };
        };
        modules = [
          agenix.nixosModules.default
          ./profiles/nvidia
        ];
      };
    };
}
