resource "aws_internet_gateway" "igw-shared" {
  vpc_id = aws_vpc.shared.id

  tags = {
    Name = "shared"
  }
}

resource "aws_internet_gateway" "igw-dev" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev"
  }
}

