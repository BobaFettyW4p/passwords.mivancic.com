resource "aws_instance" "ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.instance_key
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.securityGroup.id]

  /*user_data = <<-EOF
#!/bin/bash
echo "Installing apache2"
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
echo "apache2 installed"
EOF
*/


  tags = {
    name = "EC2 web instance"
  }

  volume_tags = {
    name = "EC2 web instance"
  }
}

