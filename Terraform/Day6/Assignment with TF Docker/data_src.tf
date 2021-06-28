data "http" "myfile" {
  depends_on = [
    null_resource.my_res_ab,
  ]

  url = "http://localhost:8888"
}
