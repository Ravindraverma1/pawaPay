resource "aws_instance" "logstash" {
  ami             = var.aws_amis[var.region]
  instance_type   = var.elk_instance_type
  key_name        = var.aws_key_name
  security_groups = [module.security.esearch_sc_id]
  subnet_id       = module.vpc.out_pub_sub1_id

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "io1"
    volume_size = "20"
    iops        = "500"
  }

  user_data = data.template_file.init_logstash.rendered

  tags = {
    Name = "Logstash instance"
  }
}

data "template_file" "init_logstash" {
  template = file("./user-data/logstash.tpl")

  vars = {
    elasticsearch_host = aws_instance.elasticsearch.private_ip
  }
}
