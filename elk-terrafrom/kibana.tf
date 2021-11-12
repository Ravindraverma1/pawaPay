data "template_file" "init_kibana" {
  template = file("./user-data/kibana.tpl")

  vars = {
    elasticsearch_host = aws_instance.elasticsearch.private_ip
  }
}

resource "aws_instance" "kibana" {
  ami             = var.aws_amis[var.region]
  instance_type   = var.elk_instance_type
  key_name        = var.aws_key_name
  security_groups = [module.security.elk_sc_id]
  subnet_id       = module.vpc.out_pub_sub1_id

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "io1"
    volume_size = "10"
    iops        = "500"
  }

  user_data = data.template_file.init_kibana.rendered

  tags = {
    Name = "Kibana instance"
  }
}

