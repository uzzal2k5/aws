
# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "private_subnets_cidr" {
  type = "list"
  default = ["192.168.1.0/24,192.168.2.0/24,192.168.3.0/24"]
}

variable "public_subnets_cidr" {
  type = "list"
  default = ["192.168.10.0/24,192.168.11.0/24,192.168.12.0/24"]
}


variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  type        = bool
  default     = false
}

variable "external_nat_ips" {
  description = "List of EIPs to be used for `nat_public_ips` output (used in combination with reuse_nat_ips and external_nat_ip_ids)"
  type        = list(string)
  default     = []
}

#AWS Client VPN
variable "vpn_endpoint_name" {
  description = "Name prefix for the resources of this stack"
}

