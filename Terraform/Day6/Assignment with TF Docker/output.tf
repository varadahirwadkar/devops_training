output "ip_addr" {
  depends_on = [
    docker_container.ubuntu_container
  ]

  value       = docker_container.ubuntu_container.ip_address
  description = "IP address of container."
}