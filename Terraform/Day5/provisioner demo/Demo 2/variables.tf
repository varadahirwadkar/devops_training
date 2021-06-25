variable "instace_ami"{
    default = "ami-0c1a7f89451184c8b"
}

variable "type"{
    default = "t2.micro"
}

variable "instance_name"{
    default = "my_ubuntu_11"
}

variable "keyname" {
    default = "tf_keyfile_demo"
}

variable "filename" {
  default = "id_ubuntu_rsa_1.pem"
}