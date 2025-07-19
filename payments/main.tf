resource "aws_security_group" "ec2" {
  name        = "ec2-sg-${var.project_name}"
  description = "Allow SSH"
  vpc_id      = module.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "example" {
  ami                         = data.aws_ssm_parameter.al2023.value
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  subnet_id                   = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  key_name                    = var.ec2_keypair_name

  tags = {
    Name = "server-${var.project_name}-2025"
  }
}