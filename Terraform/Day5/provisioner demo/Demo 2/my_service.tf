resource "null_resource" "demo_res_file5" {
  triggers = {
    public_ip   = aws_instance.ubuntu_ec2.public_ip
   // private_key = tls_private_key.tf_ubuntu_key.public_key_openssh
  }
  connection {
    type        = "ssh"
    host        = self.triggers.public_ip
    user        = "ubuntu"
    private_key = file("id_ubuntu_rsa_11.pem")

    //host        =  aws_instance.ubuntu_tf.public_ip
     //private_key = self.triggers.private_key
  }

 provisioner "file" {
    source      = "one.txt"
    destination = "/tmp/one.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp",
      "echo Inside tfff",
    ]
  }


  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo cat /tmp/one.txt",
      "sudo rm /tmp/one.txt"
    ]
  }
  depends_on =[
    aws_instance.ubuntu_ec2,
    local_file.private_key
  ]
}
