data "local_file" "myfile" {
  filename = "${path.module}\\sample.txt"
}

variable "myvar" {}

output "show" {
  value = var.myvar ? data.local_file.myfile.content : <<EOT
  Hi,
    Hello
      World!
EOT
}