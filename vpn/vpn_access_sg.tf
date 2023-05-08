resource "aws_security_group" "vpn_access_sg" {
  count       = var.vpn_security_group_id == "" ? 1 : 0
  name_prefix = "${var.vpn_endpoint_name}-Client-VPN"
  description = "security group allowing egress for client-vpn users"
  vpc_id      = data.aws_vpc.thkee_vpc.id

  tags = {
    Name               = "${var.vpn_sg_name}-Client-VPN"
    EnvName            = var.vpn_sg_name
    Service            = "client-vpn"
    TerraformWorkspace = terraform.workspace
  }
}

resource "aws_security_group_rule" "default_egress_world" {
  count             = var.vpn_security_group_id == "" ? 1 : 0
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpn_access_sg[0].id
}