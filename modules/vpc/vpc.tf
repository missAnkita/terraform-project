
//demo elastic IP creation
//Please note this is charged in AWS
resource "aws_eip" "lb" {
  domain   = "vpc"
}

output "public-ip" {
  value = aws_eip.lb.public_ip
}
//customization of output value
output "public-ip2" {
  value = "https://${aws_eip.lb.public_ip}:8080"
}
