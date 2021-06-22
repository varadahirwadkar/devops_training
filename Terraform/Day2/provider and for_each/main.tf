terraform {
  required_providers {
    random = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }
  }
}

resource "local_file" "files" {
  filename = each.value
  for_each = toset(var.filename)
}

output "show1" {
  value     = local_file.files
  sensitive = true
}