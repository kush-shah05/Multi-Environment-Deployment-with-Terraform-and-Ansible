#dev-infra
# 2 ec2 1 s3 -1 dynamo
module "dev-infra" {
  source = "./infra"
  env = "dev"
  instance_count = 2
  instance_type = "t2.micro"
  ami = "ami-0bee12a638c7a8942"
  volume_size = 10
}



#prod-infra
# 3 ec2 1 s3 1 dynamo
module "stg-infra" {
  source = "./infra"
  env = "stg"
  instance_count = 2
  instance_type = "t2.micro"
  ami = "ami-0bee12a638c7a8942"
  volume_size = 10
}




#stg-infra
# 2 ec2 1 s3 1 dynamo

module "prd-infra" {
  source = "./infra"
  env = "prd"
  instance_count = 3
  instance_type = "t2.micro"
  ami = "ami-0bee12a638c7a8942"
  volume_size = 10
}

output "dev_infra_ec2_public_ips" {
  value = module.dev-infra.ec2_public_instaces
}

output "stg_infra_ec2_public_ips" {
  value = module.stg-infra.ec2_public_instaces
}

output "prd_infra_ec2_public_ips" {
  value = module.prd-infra.ec2_public_instaces
}
