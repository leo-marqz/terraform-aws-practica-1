
output "ec2_public_ip" {
  description = "IPv4 public para EC2"
  value = aws_instance.linux_server.public_ip
}