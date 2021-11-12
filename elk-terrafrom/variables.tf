variable "env" {
  default = "dev" # valid values: dev, stage and prod
}
variable "region" {
  description = "AWS regione where launch servers"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "aws profile"
  default     = "default"
}

variable "aws_amis" {
  default = {
    us-east-1 = "ami-083654bd07b5da81d"
  }
}

variable "elk_instance_type" {
  default = "m4.large"
}

variable "aws_public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/elk-terraform.pub
DESCRIPTION
  default     = "~/.ssh/id_rsa.pub"
}

variable "aws_key_name" {
  description = "Name of the AWS key pair"
  default     = "test"
}

variable "elasticsearch_data_dir" {
  default = "/opt/elasticsearch/data"
}

variable "elasticsearch_cluster" {
  description = "Name of the elasticsearch cluster"
  default     = "elk_cluster"
}

