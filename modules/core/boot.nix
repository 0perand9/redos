{
  pkgs,
  lib,
  config,
  host,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_6_11;
    kernelModules = lib.mkAfter [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };

    kernelParams = [
      "quiet"
      "nomodeset"
      "splash"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };

    #graphical boot screen
    plymouth.enable = true;

    supportedFilesystems = [
      "ntfs"
      "lvm2"
    ];
    loader.grub = {
      enable = true;
      device = "/dev/nvme0n1";
      useOSProber = true;

      theme =
        let
          falloutTheme = pkgs.fetchFromGitHub {
            owner = "shvchk";
            repo = "fallout-grub-theme";
            rev = "80734103d0b48d724f0928e8082b6755bd3b2078";
            sha256 = "sha256-7kvLfD6Nz4cEMrmCA9yq4enyqVyqiTkVZV5y4RyUatU=";
          };
        in
        lib.mkForce "${falloutTheme}";

      # Set console resolution
      gfxmodeBios = "1920x1080";

      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Shutdown" {
          halt
        }
      '';
    };
  };
}
