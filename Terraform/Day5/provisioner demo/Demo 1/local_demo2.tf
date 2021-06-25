
resource "local_file" "one_file" {
  content  = "Hello !!"
  filename = "one.txt"
}

resource "null_resource" "sample" {
   
   provisioner "local-exec" {
      command = "more one.txt"
  }

    provisioner "local-exec" {
      when = destroy
      command = "del two.txt"
  }
}
