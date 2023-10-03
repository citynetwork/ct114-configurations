variable "keypair_name" {
  type = string
}

variable "router_name" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "secgroup_name" {
  type = string
}

variable external_network {
  type = string
  default = "ext-net"
}

variable "instance_name" {
  type = string
}

variable "image_name" {
  type = string
}

variable "instance_flavor" {
  type = string
}

variable "boot_vol_capacity" {
  type = number
}

variable "boot_vol_name" {
  type = string
}
