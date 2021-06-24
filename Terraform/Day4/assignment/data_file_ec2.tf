data "aws_instance" "ubuntu_sample_resrc" {
  filter {
    name   = "tag:Name"
    values = ["ubuntu_sample"]
  }

}

data "http" "myfile" {
  url = "http://${data.aws_instance.ubuntu_sample_resrc.public_ip}"
  depends_on = [
    null_resource.my_http_one,
  ]
}
