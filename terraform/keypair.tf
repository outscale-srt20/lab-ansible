resource "outscale_keypair" "keypair01" {
  keypair_name = "ansible"
  public_key   = file("~/.ssh/id_ed25519.pub")
}