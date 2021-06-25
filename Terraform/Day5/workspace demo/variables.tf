variable "filename" {
  type = string
  default = "common.txt"
  description = "Name of the file"
}

variable "content" {
  type = string
  default = "changed"
  description = "Contents of file"
}