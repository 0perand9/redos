{
  pkgs,
  config,
  local,
  ...
}:
{
  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
      disabledDefaultBackends = [ "escl" ];
    };
    graphics.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    xpadneo.enable = true;
    xone.enable = true;
  };

  # 6.18 Linux kernel patch for xone driver.
  nixpkgs.overlays = [
    (final: prev: {
      linuxPackages_latest = prev.linuxPackages_latest.extend (
        lpFinal: lpPrev: {
          xone = lpPrev.xone.overrideAttrs (old: {
            patches = (old.patches or [ ]) ++ [ ../../../patches/xone-ida-api.patch ];
          });
        }
      );
    })
  ];
}
