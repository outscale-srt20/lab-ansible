resource "outscale_net" "net-tp" {
  ip_range = "10.2.0.0/16"
  tags {
    key   = "Name"
    value = "net-tp"
  }
}

resource "outscale_subnet" "public_subnet-tp" {
  subregion_name = "${var.region}a"
  ip_range       = "10.2.1.0/24"
  net_id         = outscale_net.net-tp.net_id
  tags {
    key   = "Name"
    value = "public_subnet-tp"
  }
}

resource "outscale_subnet" "backend_subnet-tp" {
  subregion_name = "${var.region}a"
  ip_range       = "10.2.2.0/24"
  net_id         = outscale_net.net-tp.net_id
  tags {
    key   = "Name"
    value = "backend_subnet-tp"
  }
}

resource "outscale_internet_service" "internet_gateway-tp" {
}

resource "outscale_internet_service_link" "internet_gateway_link-tp" {
  internet_service_id = outscale_internet_service.internet_gateway-tp.internet_service_id
  net_id              = outscale_net.net-tp.net_id
}

resource "outscale_public_ip" "public_nat_gateway_ip-tp" {
  tags {
    key   = "Name"
    value = "public_nat_gateway_ip-tp"
  }
}

resource "outscale_nat_service" "public_nat_gateway-tp" {
  subnet_id    = outscale_subnet.public_subnet-tp.subnet_id
  public_ip_id = outscale_public_ip.public_nat_gateway_ip-tp.public_ip_id
  tags {
    key   = "Name"
    value = "public_nat_gateway-tp"
  }
}

resource "outscale_route_table" "private_route_table-tp" {
  net_id = outscale_net.net-tp.net_id
  tags {
    key   = "Name"
    value = "private_route_table-tp"
  }
}

resource "outscale_route_table" "public_route_table-tp" {
  net_id = outscale_net.net-tp.net_id
  tags {
    key   = "Name"
    value = "public_route_table-tp"
  }
}

resource "outscale_route" "route-IGW" {
  destination_ip_range = "0.0.0.0/0"
  gateway_id           = outscale_internet_service.internet_gateway-tp.internet_service_id
  route_table_id       = outscale_route_table.public_route_table-tp.route_table_id
}

resource "outscale_route" "to_nat_gateway-tp" {
  nat_service_id       = outscale_nat_service.public_nat_gateway-tp.nat_service_id
  destination_ip_range = "0.0.0.0/0"
  route_table_id       = outscale_route_table.private_route_table-tp.route_table_id
}

resource "outscale_route_table_link" "public_subnet_public_route_table_link-tp" {
  subnet_id      = outscale_subnet.public_subnet-tp.subnet_id
  route_table_id = outscale_route_table.public_route_table-tp.route_table_id
}

resource "outscale_route_table_link" "backend_subnet_private_route_table_link-tp" {
  subnet_id      = outscale_subnet.backend_subnet-tp.subnet_id
  route_table_id = outscale_route_table.private_route_table-tp.route_table_id
}



