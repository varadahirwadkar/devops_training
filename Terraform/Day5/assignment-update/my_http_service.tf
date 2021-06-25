resource "null_resource" "my_http_service" {
    triggers = {
        public_ip = aws_instance.demo_instance.public_ip
    }
  connection {
    type        = "ssh"
    host        = self.triggers.public_ip
    user        = "ubuntu"
    private_key = file("id_ubuntu_rsa11.pem")
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

  provisioner "remote-exec" {
    when = destroy

    inline = [
      "sudo chmod 777 /var/www/html/index.html",
      "sudo rm  /var/www/html/index.html",
      "sudo systemctl stop apache2.service",
      "sudo apt remove apache2.*",
    ]
  }
  depends_on = [aws_instance.demo_instance]
}

resource "local_file" "download_file" {
  content  = data.http.myfile.body
  filename = "out_index_file.html"
}