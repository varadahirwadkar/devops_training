data "http" "myfile" {
depends_on = [
    null_resource.my_http_service,
  ]

  url = "http://${aws_instance.demo_instance.public_ip}"
}
