variable "thkee_vpc" {}
variable "ami" {}



#Storage Management
variable "root_volume_size" {
  description = "OS Root Volume "
  default = 8
}
variable "data_volume_size" {
  description = "Volume for Application Data "
  default = 20
}

variable "dev_instance_count" {
  description = "Define the number of Development Node will be launch"
  default = 2
}

#Public Key Private Key Management
variable "public_key" {
  default = "aws_project.pub"
}

variable "private_key" {
  default = "aws_project.pem"
}

variable "key_name" {
  default = "aws_project"
  description = "Name of AWS key pair"
}


#AWS Access Management
variable "access_key" {
  description = "Access key to AWS console"
}
variable "secret_key" {
  description = "Secret key to AWS console"
}

#AWS Client VPN
variable "vpn_endpoint_name" {
  description = "Name prefix for the resources of this stack"
}

# Defining CIDR Block for VPC
variable "vpn_cidr" {
  default = "10.0.0.0/16"
}
variable "split_tunnel" {
  default     = true
  description = "With split_tunnel false, all client traffic will go through the VPN."
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "List of DNS Servers"
}
variable "enable_self_service_portal" {
  type        = bool
  default     = false
  description = "Specify whether to enable the self-service portal for the Client VPN endpoint"
}
variable "vpn_security_group_id" {
  default     = ""
  description = "Optional security group id to use instead of the default created"
}
variable "vpn_sg_name" {
  description = "Name prefix for the resources of this stack"
}

variable "authentication_type" {
  default     = "certificate-authentication"
  description = "The type of client authentication to be used. Specify certificate-authentication to use certificate-based authentication, directory-service-authentication to use Active Directory authentication, or federated-authentication to use Federated Authentication via SAML 2.0."
}

variable "authentication_saml_provider_arn" {
  default     = null
  description = "(Optional) The ARN of the IAM SAML identity provider if type is federated-authentication."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to attach to resources"
}
#CloudWatch Log
variable "logs_retention" {
  default     = 365
  description = "Retention in days for CloudWatch Log Group"
}

#Certificate
variable "organization_name" {
  description = "Name of organization to use in private certificate"
  default     = "dev project"
}