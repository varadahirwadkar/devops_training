
resource "random_id" "id" {
  byte_length = 2
}

# Pulls the image
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

# Create a container
resource "docker_container" "ubuntu_tf" {
  depends_on = [docker_network.my_net, docker_volume.shared_volume]
  image      = docker_image.ubuntu.latest
  name       = "TF_Ubuntu-${random_id.id.hex}"
  must_run   = true
  ports {
    internal = var.internal_port
    external = var.external_port
  }
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
  mounts {
    target = "/mount/test"
    source = docker_volume.shared_volume.name
    type   = "volume"
  }
  networks = [docker_network.my_net.id]

}