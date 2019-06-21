# variable "project" {}
# variable "owner" {}
# variable "maintainer" {}

locals {
  region = "${terraform.workspace == "staging" ? "europe-west2" : "europe-west1"}"
  zone = "${terraform.workspace == "staging" ? "europe-west2-a": "europe-west1-b"}"
}


module "gke" {
  source = "./gke"
  project = "fastfoodfast-221906"
  environment = "${terraform.workspace}"
  region = "${local.region}"
  zone = "${local.zone}"
  product = "bg"
  owner = "dario"
  maintainer = "dario"
}
