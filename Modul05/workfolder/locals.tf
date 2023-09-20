locals {
  tags = {
    project      = "${var.project}-${var.company}"
    owner        = var.owner
    billing_code = var.billing_code
  }
}
