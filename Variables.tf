#Region Variable
variable "Region_cidr_block" {
  description = "Region-CIDR"
  type        = string
  default     = "eu-west-1"
}

#VPC Variables
variable "vpc_cidr_block" {
  description = "VPC-CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

#Private SN Variables
variable "PrivSN_cidr_block" {
  description = "Priv-SN-CIDR"
  type        = string
  default     = "10.0.0.0/24"
}

#Private SN Variables2
variable "PrivSN2_cidr_block" {
  description = "Priv-SN2-CIDR"
  type        = string
  default     = "10.0.3.0/24"
}

#Public SN Variables
variable "PubSN_cidr_block" {
  description = "Pub-SN-CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

#Public SN Variables2
variable "PubSN2_cidr_block" {
  description = "Pub-SN2-CIDR"
  type        = string
  default     = "10.0.2.0/24"
}