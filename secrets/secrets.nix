let
  red = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOD/BTuKlVtkxnXxFc2AJXd8L7Qr6le0YkkctF7Vstat red@default"; # paste your public key here
  # You can add more users/keys if needed
in
{
  "truenas-creds.age".publicKeys = [ red ];
}