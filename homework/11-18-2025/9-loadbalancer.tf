# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

# creating the load balancer

resource "aws_lb" "southpaw-lb" {
    name = "southpaw-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.southpaw-lb-sg.id]
    subnets = [
        aws_subnet.public_a.id,
        aws_subnet.public_b.id,
        aws_subnet.public_c.id
    ]

    enable_deletion_protection = false

    tags = {
      Name = "Load balancer"
      Ownwer = "Darth Vader"
      Planet = "Mustafar"
    }

  
}


# creating listner
resource "aws_lb_listener" "southpaw-listner" {
    load_balancer_arn = aws_lb.southpaw-lb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.southpaw-tg.arn
    }
  
}
