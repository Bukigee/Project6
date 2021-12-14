resource "aws_launch_configuration" "Proj6-AS" {
  name_prefix          = "Project6-AS"
  image_id      = "ami-04632f3cef5083854" 
  instance_type = "t2.micro"

   lifecycle {
    create_before_destroy = true
  }

  
}

