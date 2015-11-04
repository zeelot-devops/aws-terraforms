resource "aws_subnet" "main-production" {
  vpc_id = "${aws_vpc.main.id}"
  count = 3
  cidr_block = "${element(split(",", var.subnets), count.index)}"
  availability_zone = "${lookup(var.availability_zones, concat("zone", count.index + 1))}"

  tags {
    Name        = "${var.app}-${var.environment}-${count.index + 1}"
    app         = "${var.app}"
    environment = "${var.environment}"
  }
}
