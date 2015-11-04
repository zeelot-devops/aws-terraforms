module "vpc-main-production" {
  source = "./modules/vpc"

  app         = "main"
  environment = "production"

  cidr = "10.50.0.0/16"
  subnets = "10.50.1.0/24,10.50.2.0/24,10.50.3.0/24"
}

output "main-production-vpc-id" {
  value = "${module.vpc-main-production.vpc_id}"
}

module "vpc-ops-production" {
  source = "./modules/vpc"

  app         = "ops"
  environment = "production"

  cidr = "10.10.0.0/16"
  subnets = "10.10.1.0/24,10.10.2.0/24,10.10.3.0/24"
}

output "ops-production-vpc-id" {
  value = "${module.vpc-ops-production.vpc_id}"
}
