# Terraform AWS Infrastructure

This repository contains Terraform code for provisioning infrastructure on AWS.

## Overview

This Terraform configuration provisions the following resources on AWS:
- Virtual Private Cloud (VPC)
- Internet Gateway
- Custom Route Table
- Subnets in two Availability Zones
- Route Table Associations
- Security Groups for EC2 instances and Application Load Balancer
- Launch Template
- Auto Scaling Group
- Target Group
- Application Load Balancer
- A listner for the Application Load Balancer
- Target Group attachment to Auto Scaling Group

## Prerequisites

Before running Terraform commands, make sure you have the following prerequisites installed:
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS Access Key ID and Secret Access Key (configured either through AWS CLI, environment variables, or IAM roles)

## Usage

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/guddev99/terraform-aws-infrastructure.git
   ```

2. Navigate to the project directory:
   ```bash
   cd terraform-aws-infrastructure
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review and customize the variables in `variables.tf` and other `.tf` files as needed.

5. Plan the Terraform execution to see what resources will be created, updated, or destroyed:
   ```bash
   terraform plan
   ```

6. Apply the Terraform configuration to create or update the resources:
   ```bash
   terraform apply
   ```

7. After you're finished using the resources, you can destroy them:
   ```bash
   terraform destroy
   ```

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.