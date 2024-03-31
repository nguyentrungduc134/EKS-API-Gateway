resource "aws_vpc" "shared" {
  cidr_block = "19.0.0.0/16"

  tags = {
    Name = "shared"
  }
}
resource "aws_vpc" "dev" {
  cidr_block = "19.1.0.0/16"

  tags = {
    Name = "dev"
  }
}

resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = aws_vpc.shared.id
  vpc_id        = aws_vpc.dev.id
  peer_region   = "us-east-1"
}

output "vpc" {
  value = "${aws_vpc.dev.id}"
}

