## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.65.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security"></a> [security](#module\_security) | ./security | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.elasticsearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.kibana](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.logstash](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.elk_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [template_file.init_elasticsearch](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.init_kibana](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.init_logstash](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_amis"></a> [aws\_amis](#input\_aws\_amis) | n/a | `map` | <pre>{<br>  "us-east-1": "ami-083654bd07b5da81d"<br>}</pre> | no |
| <a name="input_aws_key_name"></a> [aws\_key\_name](#input\_aws\_key\_name) | Name of the AWS key pair | `string` | `"test"` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | aws profile | `string` | `"default"` | no |
| <a name="input_aws_public_key_path"></a> [aws\_public\_key\_path](#input\_aws\_public\_key\_path) | Path to the SSH public key to be used for authentication.<br>Ensure this keypair is added to your local SSH agent so provisioners can<br>connect.<br>Example: ~/.ssh/elk-terraform.pub | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_elasticsearch_cluster"></a> [elasticsearch\_cluster](#input\_elasticsearch\_cluster) | Name of the elasticsearch cluster | `string` | `"elk_cluster"` | no |
| <a name="input_elasticsearch_data_dir"></a> [elasticsearch\_data\_dir](#input\_elasticsearch\_data\_dir) | n/a | `string` | `"/opt/elasticsearch/data"` | no |
| <a name="input_elk_instance_type"></a> [elk\_instance\_type](#input\_elk\_instance\_type) | n/a | `string` | `"m4.large"` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"dev"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS regione where launch servers | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticsearch_ip"></a> [elasticsearch\_ip](#output\_elasticsearch\_ip) | n/a |
| <a name="output_kibana_url"></a> [kibana\_url](#output\_kibana\_url) | n/a |
| <a name="output_logstash_ip"></a> [logstash\_ip](#output\_logstash\_ip) | n/a |

## KIBANA OUTPUT
![alt text](docs/output.png)
![alt text](docs/kibana.png)
