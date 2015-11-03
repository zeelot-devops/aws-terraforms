variable "availability_zones" {
    default = {
        zone1 = "a"
        zone2 = "b"
        zone3 = "c"
    }
}

resource "aws_vpc" "main-production" {
  cidr_block = "10.50.0.0/16"

  tags = {
    Name        = "main-production"
    app         = "main"
    environment = "production"
  }
}

resource "aws_internet_gateway" "main-production" {
  vpc_id = "${aws_vpc.main-production.id}"

  tags {
    Name = "main-production"
    app         = "main"
    environment = "production"
  }
}

resource "aws_subnet" "main-production" {
  vpc_id = "${aws_vpc.main-production.id}"
  count = 3
  cidr_block = "10.50.${count.index + 1}.0/24"
  availability_zone = "${var.region}${lookup(var.availability_zones, concat("zone", count.index + 1))}"

  tags {
    Name        = "main-production-${count.index + 1}"
    app         = "main"
    environment = "production"
  }
}

resource "aws_route_table" "main-production" {
  vpc_id = "${aws_vpc.main-production.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-production.id}"
  }

  tags {
    Name        = "main-production"
    app         = "main"
    environment = "production"
  }
}

resource "aws_main_route_table_association" "main-production" {
  vpc_id = "${aws_vpc.main-production.id}"
  route_table_id = "${aws_route_table.main-production.id}"
}
