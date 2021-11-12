
resource "aws_instance" "elasticsearch" {
  ami             = var.aws_amis[var.region]
  instance_type   = var.elk_instance_type
  key_name        = var.aws_key_name
  security_groups = [module.security.elasticsearch_sc_id]
  subnet_id       = module.vpc.out_pub_sub1_id

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "io1"
    volume_size = "20"
    iops        = "500"
  }

  user_data = data.template_file.init_elasticsearch.rendered

  tags = {
    Name = "Elasticsearch instance"
  }
}

data "template_file" "init_elasticsearch" {
  template = file("./user-data/elasticsearch.tpl")

  vars = {
    elasticsearch_cluster  = var.elasticsearch_cluster
    elasticsearch_data_dir = var.elasticsearch_data_dir
  }
}

