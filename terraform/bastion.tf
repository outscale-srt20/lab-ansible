resource "outscale_public_ip" "my_public_ip-tp" {
}

resource "outscale_public_ip_link" "my_public_ip_link-tp" {
  vm_id     = outscale_vm.bastion-tp.vm_id
  public_ip = outscale_public_ip.my_public_ip-tp.public_ip
}

resource "outscale_vm" "bastion-tp" {
  image_id     = "ami-4b2651bc"
  vm_type      = "tinav6.c2r4p1"
  keypair_name = outscale_keypair.keypair01.keypair_name
  security_group_ids = [
    outscale_security_group.sg-ssh-all-tp.security_group_id,
  ]
  private_ips = ["10.2.1.10"]
  subnet_id   = outscale_subnet.public_subnet-tp.id
  state       = "running"
  tags {
    key   = "Name"
    value = "bastion-tp"
  }
  tags {
    key   = "Group"
    value = "bastions"
  }
  tags {
    key   = "Env"
    value = "lab_ansible"
  }
}

output "public_ip" {
  value = outscale_vm.bastion-tp.public_ip

}
