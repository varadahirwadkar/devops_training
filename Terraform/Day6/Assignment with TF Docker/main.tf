
resource "docker_image" "my_ubuntu_img" {
  name         = "ubuntu:latest"
  keep_locally = true
}
resource "docker_container" "ubuntu_container" {
  depends_on = [docker_network.my_net, docker_volume.shared_volume]

  image = docker_image.my_ubuntu_img.latest
  name  = var.container_name

  ports {
    internal = var.ssh_internal_port
    external = var.ssh_external_port
  }

  ports {
    internal = var.http_internal_port
    external = var.http_external_port
  }

  mounts {
    target = "/mount/test"
    source = docker_volume.shared_volume.name
    type   = "volume"
  }



  networks = [docker_network.my_net.id]
  command  = ["tail", "-f", "/dev/null"]
}