resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-dev.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-dev.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "private-dev-1a" {
  subnet_id      = aws_subnet.private-dev-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-dev-1b" {
  subnet_id      = aws_subnet.private-dev-1b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-dev-1a" {
  subnet_id      = aws_subnet.public-dev-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-dev-1b" {
  subnet_id      = aws_subnet.public-dev-1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private-shared" {
  vpc_id = aws_vpc.shared.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-shared.id
  }

  tags = {
    Name = "private-shared"
  }
}

resource "aws_route_table" "public-shared" {
  vpc_id = aws_vpc.shared.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-shared.id
  }

  tags = {
    Name = "public-shared"
  }
}

resource "aws_route_table_association" "private-shared-1a" {
  subnet_id      = aws_subnet.private-shared-1a.id
  route_table_id = aws_route_table.private-shared.id
}

resource "aws_route_table_association" "public-shared-1a" {
  subnet_id      = aws_subnet.public-shared-1a.id
  route_table_id = aws_route_table.public-shared.id
}

