resource "aws_eip" "nat-dev" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat-dev" {
  allocation_id = aws_eip.nat-dev.id
  subnet_id     = aws_subnet.public-dev-1a.id

  tags = {
    Name = "nat-dev"
  }

  depends_on = [aws_internet_gateway.igw-dev]
}

resource "aws_eip" "nat-shared" {
  vpc = true

  tags = {
    Name = "nat-shared"
  }
}

resource "aws_nat_gateway" "nat-shared" {
  allocation_id = aws_eip.nat-shared.id
  subnet_id     = aws_subnet.public-shared-1a.id

  tags = {
    Name = "nat-shared"
  }

  depends_on = [aws_internet_gateway.igw-shared]
}


