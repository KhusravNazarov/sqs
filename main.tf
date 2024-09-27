# simple aws sqs
resource "aws_sqs_queue" "simple-queue" {
  name                      = "simple-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

# providers
provider "aws" {
  region = "eu-east-1"
}
terraform {
  required_version = ">=1.8.0, <1.9"  // terraform version 
  required_providers {       //provider version 
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.49.0" //lazy constraint
    }
  }
}



# backend
terraform {
  backend "s3" {
    bucket = "terraform-khusrav"
    key = "harness/terraform.tfstate"  //Path to your remote Backend file (terraform.tfstate)
    region = "us-west-2"
  }
}
