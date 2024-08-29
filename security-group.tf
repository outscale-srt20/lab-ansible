resource "outscale_security_group_rule" "security_group_rule01-tp" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg-ssh-all-tp.id
  from_port_range   = "22"
  to_port_range     = "22"
  ip_protocol       = "tcp"
  ip_range          = "0.0.0.0/0"
}

resource "outscale_security_group_rule" "security_group_rule02-tp" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg-ssh-all-tp.id
  from_port_range   = "22"
  to_port_range     = "22"
  ip_protocol       = "tcp"
  ip_range          = "10.2.0.0/16"
}

resource "outscale_security_group" "sg-ssh-all-tp" {
  description         = "Permit SSH from All"
  security_group_name = "seg-ssh-all-tp"
  net_id              = outscale_net.net-tp.net_id
}