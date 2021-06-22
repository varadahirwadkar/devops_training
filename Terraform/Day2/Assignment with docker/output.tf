output "ip_addr" {
  depends_on = [
    docker_container.ubuntu_tf
  ]
  value = docker_container.ubuntu_tf.ip_address

}