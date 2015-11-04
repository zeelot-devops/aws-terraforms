resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name        = "${var.app}-${var.environment}"
    app         = "${var.app}"
    environment = "${var.environment}"
  }
}
