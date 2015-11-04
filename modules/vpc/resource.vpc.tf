resource "aws_vpc" "main" {
  cidr_block = "${var.cidr}"

  tags = {
    Name        = "${var.app}-${var.environment}"
    app         = "${var.app}"
    environment = "${var.environment}"
  }
}
