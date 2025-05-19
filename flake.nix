{
  description = "RedOs";
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix/release-24.11";
    nvf.url = "github:notashelf/nvf";
    nix-comfyui.url = "github:dyscorv/nix-comfyui";
    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, nix-comfyui, nixpkgs-unstable, ... }@inputs:
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
        };
        modules = [
          ./profiles/nvidia
          ({ pkgs, ... }: {
            # Add the overlay to make comfyuiPackages available
            nixpkgs.overlays = [ nix-comfyui.overlays.default ];
            
            # Add ComfyUI to system packages
            environment.systemPackages = with pkgs; [
              # Basic ComfyUI
              comfyuiPackages.comfyui
              
              # OR ComfyUI with extensions (uncomment if you want all extensions)
              # comfyuiPackages.comfyui-with-extensions
            ];
          })
        ];
      };
    };
}