provider “aws” {
region = “us-east-1”
access_key = “ACCESS_KEY”
secret_key = “SECRET_ACCESS_KEY”
}

resource “aws_instance” “us-east-1” {
ami = “ami-0756a1c858554433e”
instance_type = “t2.micro”
tags = {
Name = “Frontend”
}
}

resource “aws_instance” “us-east-1” {
ami = “ami-0756a1c858554433e”
instance_type = “t2.micro”
tags = {
Name = “Backend”
}
}

resource “aws_instance” “us-east-1” {
ami = “ami-0756a1c858554433e”
instance_type = “t2.micro”
tags = {
Name = “CronServer”
}
}

resource "aws_s3_bucket" "b" {
  bucket = "Bucket-for-CDN-Cloudfront"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "RDS-cluster-to-store-data-of-users-AURORA"
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}


