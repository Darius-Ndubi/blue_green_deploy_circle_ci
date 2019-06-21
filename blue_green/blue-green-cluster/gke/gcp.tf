provider "google" {
  credentials = "${file("/Users/dariusndubi/Documents/infra/blue/blue-cluster/blue-cluster-terraform/gke/secrets/account.json")}"
  project = "${var.project}"
  region = "${var.region}"
  zone = "${var.zone}"
}
