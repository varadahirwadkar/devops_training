
output "public_ip" {
    depends_on = [
    aws_instance.ubuntu_tf
  ]
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.ubuntu_tf.public_ip
}