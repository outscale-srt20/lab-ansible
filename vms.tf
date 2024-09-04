resource "outscale_vm" "webserver1" {
  image_id     = "ami-4b2651bc"
  vm_type      = "tinav6.c2r4p3"
  keypair_name = outscale_keypair.keypair01.keypair_name
  security_group_ids = [
    outscale_security_group.sg-ssh-all-tp.security_group_id,
  ]
  private_ips = ["10.2.2.10"]
  subnet_id   = outscale_subnet.backend_subnet-tp.subnet_id
  state       = "running"
  tags {
    key   = "Name"
    value = "webserver1"
  }
  tags {
    key   = "Group"
    value = "webservers"
  }
  tags {
    key   = "Env"
    value = "lab_ansible"
  }
}

resource "outscale_vm" "webserver2" {
  image_id     = "ami-4b2651bc"
  vm_type      = "tinav6.c2r4p3"
  keypair_name = outscale_keypair.keypair01.keypair_name
  security_group_ids = [
    outscale_security_group.sg-ssh-all-tp.security_group_id,
  ]
  private_ips = ["10.2.2.11"]
  subnet_id   = outscale_subnet.backend_subnet-tp.subnet_id
  state       = "running"
  tags {
    key   = "Name"
    value = "webserver2"
  }
  tags {
    key   = "Group"
    value = "webservers"
  }
  tags {
    key   = "Env"
    value = "lab_ansible"
  }
}

resource "outscale_vm" "database1" {
  image_id     = "ami-4b2651bc"
  vm_type      = "tinav6.c2r4p3"
  keypair_name = outscale_keypair.keypair01.keypair_name
  security_group_ids = [
    outscale_security_group.sg-ssh-all-tp.security_group_id,
  ]
  private_ips = ["10.2.2.20"]
  subnet_id   = outscale_subnet.backend_subnet-tp.subnet_id
  state       = "running"
  tags {
    key   = "Name"
    value = "dbserver1"
  }
  tags {
    key   = "Group"
    value = "dbservers"
  }
  tags {
    key   = "Env"
    value = "lab_ansible"
  }
}
