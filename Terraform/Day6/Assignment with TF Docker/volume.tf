resource "docker_volume" "shared_volume" {
  name = "varad-${var.volume_name}"
}