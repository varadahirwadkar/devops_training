resource "aws_instance" "ubuntu_tf" {
  ami           = var.instace_ami
  instance_type = var.type
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = ["${var.sg_id}"]
  tags = {
    Name = var.instance_name
  }
 
}


resource "null_resource" "my_instance_provisioning" {
  
  triggers ={
    public_ip = aws_instance.ubuntu_tf.public_ip
  }

     provisioner "remote-exec" {
      when = destroy

      connection {
        type        = "ssh"
        host        = self.triggers.public_ip
        user        = "ubuntu"
        private_key = file("id_ubuntu_rsa.pem")
  }
         inline = [
            "sudo su",
            "sudo apt remove apache2",
            "sudo rm myfile.txt"
    ]
  }
}


resource "tls_private_key" "tf_ubuntu_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "tf_keyfile"
  public_key = tls_private_key.tf_ubuntu_key.public_key_openssh
}

resource "local_file" "private_key"{
    content = tls_private_key.tf_ubuntu_key.private_key_pem
    filename = "id_ubuntu_rsa.pem"
}