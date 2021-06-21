resource "random_password" "password" {
  length           = 8
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
}

variable "user_name" {
  type = string
}

output "user_info" {
  sensitive = true
  value     = "Hi ${var.user_name}, your password is ${random_password.password.result}"
}
