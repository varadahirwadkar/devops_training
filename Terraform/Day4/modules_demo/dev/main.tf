
module "security_gp" {
  source      = "../modules/security_gp"
  protocol    = "tcp"
  ssh_port    = 22
  http_port   = 22
  sg_name     = "my_sample_sg"
}


module "my_ec2" {
  source        = "../modules/ec2"
  type          = "t2.micro"
  instance_name = "my_ubuntu_sample_insatnce"
  sg_id = "${module.security_gp.SG_ID}"
}