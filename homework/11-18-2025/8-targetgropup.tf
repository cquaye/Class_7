# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

# creating target group

resource "aws_lb_target_group" "southpaw-tg" {
    name = "southpaw-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.southpawsat.id
    target_type = "instance"

    health_check {
      enabled = true
      interval = 30
      path = "/"
      protocol = "HTTP"
      healthy_threshold = 5
      unhealthy_threshold = 3
      timeout = 6
      matcher = "200"
    }


    tags = {
      Name = "target group"
      Owner = "Darth Vader"
      Planet = "Mustafar"
    }
  
}