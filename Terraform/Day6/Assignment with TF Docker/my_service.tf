resource "null_resource" "my_res_ab" {

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("id_rsa_ubuntu")
    host        = "localhost"
  }


  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "apt install apache2 -y",
      "chmod 777 /var/www/html",
      "mv /tmp/index.html /var/www/html/index.html",
      "service enable apache2",
      "service apache2 start"
    ]
  }

  provisioner "remote-exec" {
    when = destroy

    inline = [
      "rm  /var/www/html/index.html",
      "service apache2 stop",
      "apt remove apache2.*",
    ]
  }

  depends_on = [
    docker_container.ubuntu_container
  ]
}

resource "local_file" "download_file" {
  content  = data.http.myfile.body
  filename = "out_index_file.html"
}