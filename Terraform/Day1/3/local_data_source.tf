data "local_file" "foo" {
  filename = "sample.txt"
}

output "show" {
  value = data.local_file.foo.content
}