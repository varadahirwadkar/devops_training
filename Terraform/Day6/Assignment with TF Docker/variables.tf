variable "container_name" {
  default = "my_ubuntu_container"
}

variable "ssh_internal_port" {
  default = "22"
}

variable "ssh_external_port" {
  default = "22"
}

variable "http_internal_port" {
  default = "80"
}

variable "http_external_port" {
  default = "8888"
}

variable "volume_name" {
  default = "my_ubuntu_vol"
}

variable "host_path" {
  default = "/C/Users/Varad/Desktop/terraform/my_example/data/"
}

variable "container_path" {
  default = "/tmp/"
}