resource "aws_subnet" "private-dev-1a" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "19.1.128.0/20"
  availability_zone = "us-east-1a"

  tags = {
    "Name"                                      = "private-dev-1a"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private-dev-1b" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "19.1.144.0/20"
  availability_zone = "us-east-1b"

  tags = {
    "Name"                                      = "private-dev-1b"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-dev-1a" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "19.1.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-dev-1a"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-dev-1b" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "19.1.16.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-dev-1b"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
resource "aws_subnet" "public-shared-1a" {
  vpc_id                  = aws_vpc.shared.id
  cidr_block              = "19.0.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-shared-1a"
  }
}

resource "aws_subnet" "private-shared-1a" {
  vpc_id                  = aws_vpc.shared.id
  cidr_block              = "19.0.128.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "private-shared-1a"
  }
}


