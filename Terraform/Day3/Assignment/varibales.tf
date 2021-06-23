
variable "instance_name"{
    type = string
    description = "Name of EC2 Instance"
}

variable "type"{
    type = string
    default = "t2.micro"
    description = "EC2 Instance type"
}
variable "instace_ami" {
   type = string
   default = "ami-0c1a7f89451184c8b"
   description = "AMI for EC2 instance"
}

variable "volume_name"{
    type = string
    description = "name of the volume"
}

variable  "vol_device_name"{
    type = string
    default = "/dev/sdh"
    description = "Device name for volume"
}

variable "size"{
    type = number
    default  = 2
    description = "Size of EBS volume"
}
