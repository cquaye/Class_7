resource "aws_autoscaling_group" "autosclaer" {
    name = "autoscaler"
    min_size = 1
    max_size = 6
    desired_capacity = 3
    
    health_check_type = "ELB"
    health_check_grace_period = 300
    force_delete = true
    target_group_arns = [aws_lb_target_group.southpaw-tg.arn]

    vpc_zone_identifier = [
        aws_subnet.private_a.id,
        aws_subnet.private_b.id,
        aws_subnet.private_c.id
    ]

    launch_template {
      id = aws_launch_template.instnce_temp.id
      version = "$Latest"
    }

    tag {
      key = "Name"
      value = "autoscaler"
      propagate_at_launch = true
    }

    tag {
      key = "Environment"
      value = "Dev"
      propagate_at_launch = true
    }
  
}



#Auto scaling policy
# tracking cpu utilization at 75% scale up or down based on load

resource "aws_autoscaling_policy" "auto_policy" {
    name = "auto_policy"
    policy_type = "TargetTrackingScaling"
    estimated_instance_warmup = 120
    autoscaling_group_name = aws_autoscaling_group.autosclaer.name
    
    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }
      target_value = 50.0
    }

  
}


# Connect autoscaler to lodbalancer

resource "aws_autoscaling_attachment" "autoscale_connect" {
    autoscaling_group_name = aws_autoscaling_group.autosclaer.id
    lb_target_group_arn = aws_lb_target_group.southpaw-tg.arn
    
  
}