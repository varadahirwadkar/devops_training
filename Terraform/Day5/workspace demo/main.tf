module "varad_template" {
  source = "./modules/create_file"
  filename = var.filename
  content = var.content
}