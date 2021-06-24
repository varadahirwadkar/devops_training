resource "null_resource" "my_http_one" {
  triggers = {
    public_ip = data.aws_instance.ubuntu_sample_resrc.public_ip
  }
  connection {
    type        = "ssh"
    host        = self.triggers.public_ip
    user        = "ubuntu"
    private_key = file("ubuntu_sample.pem")
  }

  provisioner "file" {
    source      = "httpd_server.sh"
    destination = "/tmp/httpd_server.sh"
  }
  
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/httpd_server.sh",
      "sh /tmp/httpd_server.sh",
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo systemctl enable apache2.service",
      "sudo systemctl start apache2.service",
    ]
  }
  /*
  provisioner "remote-exec" {
    when = destroy

    inline = [
      "sudo su",
      "sudo apt remove apache2",
      "sudo rm /var/www/html/index.html"
    ]
  }*/
  depends_on = [data.aws_instance.ubuntu_sample_resrc]
}

resource "aws_security_group" "webSG" {
  name        = "webSG"
  description = "Allow ssh  inbound traffic"

  ingress {
    description = "For SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "For HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.webSG.id
  network_interface_id = data.aws_instance.ubuntu_sample_resrc.network_interface_id
}

resource "local_file" "download_file" {
  content  = data.http.myfile.body
  filename = "out_index_file.html"
}