
resource "aws_vpc" "abc_vrg_vpc" {
    cidr_block = var.vpc_vrg
    tags = {
        Name = "VPC - ABC Enterprise"
    }
    provider = aws.virginia
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id = aws_vpc.abc_vrg_vpc.id
    cidr_block = var.subnets[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "Public Subnet - ABC Enterprise"
    }
}

resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.abc_vrg_vpc.id
    cidr_block = var.subnets[1]
    depends_on = [ 
        # indica que se debe esperar a que se cree
        # primero la subnet public 
        aws_subnet.public_subnet_1
     ]
    tags = {
        Name = "Private Subnet - ABC Enterprise"
    }
}

resource "aws_instance" "linux_server" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1.id
  tags = {
    Name = "EC2 - Linux Web Server"
  }
}