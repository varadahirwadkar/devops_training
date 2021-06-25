output "file_content" {
    depends_on = [
      local_file.template_file_env
    ]
  description = "display contents of file"
  value = data.local_file.file
}