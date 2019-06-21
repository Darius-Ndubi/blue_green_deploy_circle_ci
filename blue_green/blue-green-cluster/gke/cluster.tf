resource "google_container_cluster" "blue-cluster" {
  name               = "blue-${var.environment}"
  zone               = "${var.zone}"
  network = "${google_compute_network.blue-network.self_link}"
  subnetwork = "${google_compute_subnetwork.blue-subnet.self_link}"
  remove_default_node_pool = true
  initial_node_count = 1

  resource_labels = {
    product = "${var.product}"
    component = "apprenticeship_resources"
    env = "${var.environment}"
    owner = "${var.owner}"
    maintainer = "${var.maintainer}"
    state = "in_use"
  }

}

resource "google_container_node_pool" "primary_nodes" {
  name       = "updated-pool"
  cluster    = "${google_container_cluster.blue-cluster.name}"
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
  ]
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }

  
}


# resource "kubernetes_cluster_role_binding" "role-bind" {
#     metadata {
#         name = "terraform-role-bind"
#     }
#     role_ref {
#         api_group = "rbac.authorization.k8s.io"
#         kind = "ClusterRole"
#         name = "cluster-admin"
#     }
#     subject {
#         kind = "User"
#         name = "admin"
#         api_group = "rbac.authorization.k8s.io"
#     }
#     subject {
#         kind = "ServiceAccount"
#         name = "default"
#         namespace = "kube-system"
#     }
#     subject {
#         kind = "Group"
#         name = "system:masters"
#         api_group = "rbac.authorization.k8s.io"
#     }
# }