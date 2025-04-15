{ pkgs, ... }:
{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    enable = true;
    drivers = [ pkgs.cnijfilter2 ];
  };
  hardware.sane.enable = true; # enables support for SANE scanners
}