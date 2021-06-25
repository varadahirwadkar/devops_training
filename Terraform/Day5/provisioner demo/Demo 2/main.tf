resource "aws_instance" "ubuntu_ec2" {
  ami           = var.instace_ami
  instance_type = var.type
  key_name      = aws_key_pair.generated_key.key_name
  tags = {
    Name = var.instance_name
  }
}

resource "tls_private_key" "tf_ubuntu_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.keyname
  public_key = tls_private_key.tf_ubuntu_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.tf_ubuntu_key.private_key_pem
  filename = var.filename
}