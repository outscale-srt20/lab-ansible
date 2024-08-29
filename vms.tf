resource "outscale_vm" "pres-tp" {
  image_id     = "ami-4b2651bc"
  vm_type      = "tinav6.c2r4p1"
  keypair_name = outscale_keypair.keypair01.keypair_name
  security_group_ids = [
    outscale_security_group.sg-ssh-all-tp.security_group_id,
  ]
  private_ips = ["10.2.2.10"]
  subnet_id   = outscale_subnet.backend_subnet-tp.subnet_id
  state       = "running"
  tags {
    key   = "Name"
    value = "pres-tp"
  }
  tags {
    key   = "Group"
    value = "pres"
  }
  tags {
    key   = "Env"
    value = "lab-ansible"
  }
}

resource "outscale_vm" "data-tp" {
  image_id     = "ami-4b2651bc"
  vm_type      = "tinav6.c2r4p1"
  keypair_name = outscale_keypair.keypair01.keypair_name
  security_group_ids = [
    outscale_security_group.sg-ssh-all-tp.security_group_id,
  ]
  private_ips = ["10.2.2.11"]
  subnet_id   = outscale_subnet.backend_subnet-tp.subnet_id
  state       = "running"
  tags {
    key   = "Name"
    value = "data-tp"
  }
  tags {
    key   = "Group"
    value = "data"
  }
  tags {
    key   = "Env"
    value = "lab-ansible"
  }
}
