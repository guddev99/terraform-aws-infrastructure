resource "aws_launch_template" "tf-LT" {
  name                   = "tf-LT"
  image_id               = var.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.tf-SG.id]
  key_name               = var.key_name

  user_data = base64encode(<<EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
  EOF
  )

  tags = {
    Name = "tf-LT"
  }
}

