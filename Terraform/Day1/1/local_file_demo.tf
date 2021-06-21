resource "local_file" "pet" {
  filename        = "pets.txt"
  content         = "Dogs,cats are pet! "
  file_permission = "0770"
}
