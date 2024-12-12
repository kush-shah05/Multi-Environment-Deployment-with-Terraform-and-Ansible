
resource "aws_key_pair" "deployer" {
  key_name   = "${var.env}terra-automate-key"
  public_key = file("/home/ubuntu/terra-ansible-multi-env/terraform/kush-prac-terra-key.pub")
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_user_to_connect" {
  name        = "${var.env}-sg"
  description = "Allow user to connect via sg"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    description = "port 22 allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = " allow all outgoing traffic "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 80 allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 443 allow"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-sg" 
    Environment=var.env
  }
}

resource "aws_instance" "my_instance" {
  count = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.allow_user_to_connect.name]
  tags = {
    Name = "${var.env}-kush-prac-server"
    Environment=var.env
  }
  root_block_device {
    volume_size = var.volume_size 
    volume_type = "gp3"
  }
}
