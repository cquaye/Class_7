#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template

# creating instance template
resource "aws_launch_template" "instnce_temp" {
    name = "instance_temp"
    image_id = "ami-06d455b8b50b0de4d"
    instance_type = "t3.micro" 
    #instance_initiated_shutdown_behavior = "terminate"
    vpc_security_group_ids = [ aws_security_group.southpaw-sg.id ]


    user_data = filebase64("./user_data1.sh")


    tag_specifications {
      resource_type = "instance"
      tags = {
        Name = "instance template-LB"
        Owner = "Darth Vader"
        Planet = "Mustafar"

      }
    }
}