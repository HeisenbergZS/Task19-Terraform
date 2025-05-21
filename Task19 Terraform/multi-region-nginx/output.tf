output "nginx_region1_public_ip" {
  description = "Public IP of EC2 instance in region 1"
  value       = aws_instance.nginx_region1.public_ip
}

output "nginx_region2_public_ip" {
  description = "Public IP of EC2 instance in region 2"
  value       = aws_instance.nginx_region2.public_ip
}
