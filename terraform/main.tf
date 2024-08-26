provider "google" {
  project = "your-gcp-project-id"
  region  = "asia-southeast1"  # Singapore region
}

# GKE Cluster Setup
resource "google_container_cluster" "shared_cluster" {
  name     = "shared-cluster"
  location = "asia-southeast1-a"
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.shared_cluster.name
}
