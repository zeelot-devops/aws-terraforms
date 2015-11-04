variable "app" { }
variable "environment" { }
variable "cidr" { }
variable "subnets" { }

variable "availability_zones" {
    default = {
        zone1 = "us-west-2a"
        zone2 = "us-west-2b"
        zone3 = "us-west-2c"
    }
}
