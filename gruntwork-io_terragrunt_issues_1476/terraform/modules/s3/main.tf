locals {
    name = "${var.default_tags["environment"]}-${var.default_tags["env_suffix"]}-${var.default_tags["application_name"]}-${var.default_tags["component"]}"
}