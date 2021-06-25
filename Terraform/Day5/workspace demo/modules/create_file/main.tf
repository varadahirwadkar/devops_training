resource "local_file" "template_file_env" {
  filename = var.filename
  content  = var.content
}


data "local_file" "file" {
    depends_on = [
        local_file.template_file_env
    ]
    filename = "${var.filename}"
}