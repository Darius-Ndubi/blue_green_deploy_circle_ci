resource "google_compute_network" "blue-network" {
  name = "blue-${var.environment}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "blue-subnet" {
  name   = "blue-${var.environment}-subnet"
  ip_cidr_range = "10.0.0.0/18"
  region = "${var.region}"
  network = "${google_compute_network.blue-network.self_link}"
  private_ip_google_access = "true"
}