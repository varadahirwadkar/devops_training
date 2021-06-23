resource "random_id" "id" {
  byte_length = 2
}

resource "aws_instance" "ubuntu_tf" {
  ami           = var.instace_ami
  instance_type = var.type
  key_name      = aws_key_pair.generated_key.key_name
  tags = {
    Name = "${var.instance_name}-${random_id.id.hex}"
  }
}

resource "aws_ebs_volume" "myvolume" {
  availability_zone = aws_instance.ubuntu_tf.availability_zone
  size              =  var.size
   tags = {
    Name = "varad-${var.volume_name}"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.vol_device_name
  volume_id   = aws_ebs_volume.myvolume.id
  instance_id = aws_instance.ubuntu_tf.id
}

resource "tls_private_key" "tf_ubuntu_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ubuntu_tf_keys"
  public_key = tls_private_key.tf_ubuntu_key.public_key_openssh
}