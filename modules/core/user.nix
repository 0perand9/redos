{
  username,
  pkgs,
  host,
  profile,
  inputs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        profile
        ;
    }; 
    users.${username} = {
      imports = [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
      };
      programs.home-manager.enable = true;
    };
  };
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "adbusers"
      "docker"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
      "input"
    ];
    
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
