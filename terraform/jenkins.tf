/**
* A security group to allow SSH access into our load balancer
*/

resource "aws_security_group" "lb" {
  name   = "ecs-alb-security-group"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Application = "jenkins-lb-sg"
  }
}

/**
*Load Balancer to be attached to the ECS cluster to distribute the load among instances
*/

resource "aws_elb" "jenkins_elb" {
  subnets                   = [aws_subnet.public-shared-1a.id]
  cross_zone_load_balancing = true
  security_groups           = [aws_security_group.lb.id]
  instances                 = [aws_instance.jenkins_master.id]
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8080"
    interval            = 5
  }

  tags = {
    Name = "jenkins_elb"
  }
}


output "load-balancer-ip" {
  value = aws_elb.jenkins_elb.dns_name
}
resource "aws_instance" "jenkins_master" {
  ami                    = data.aws_ami.jenkins-master.id
  instance_type          = "t2.large"
  key_name               = mykey-02
  vpc_security_group_ids = [aws_security_group.jenkins_master_sg.id]
  subnet_id              = aws_subnet.private-shared-1a.id

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = false
  }
  tags = {
    Name = "jenkins_master"
  }
}


/**
* This parameter contains our baked AMI ID fetch from the Amazon Console
*/

data "aws_ami" "jenkins-master" {
  most_recent = true
  owners      = ["self"]
}

resource "aws_security_group" "jenkins_master_sg" {
  name        = "jenkins_master_sg"
  description = "Allow traffic on port 8080 and enable SSH"
  vpc_id      = aws_vpc.shared.id


  ingress {
    from_port       = "22"
    to_port         = "22"
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    from_port       = "8080"
    to_port         = "8080"
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_master_sg"
  }
}
