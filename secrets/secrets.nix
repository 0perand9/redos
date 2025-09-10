let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJO1EooC9qN60aRmgQ3QwbS86222xNOXqF2bW5L6Td4W root@default";
in
{
  "truenas-creds.age".publicKeys = [ system ];
  "tailscale-creds.age".publicKeys = [ system ];
} 