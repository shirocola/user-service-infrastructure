provider "google" {
  project = "your-gcp-project-id"
  region  = "asia-southeast1"  # Singapore region
}

# GKE Cluster Setup
resource "google_container_cluster" "user_service_cluster" {
  name     = "user-service-cluster"
  location = "asia-southeast1"  # Singapore region
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "user_service_pool" {
  name       = "user-service-pool"
  cluster    = google_container_cluster.user_service_cluster.name
  location   = google_container_cluster.user_service_cluster.location
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

# Google Container Registry Setup
resource "google_container_registry" "user_service_registry" {
  project = "your-gcp-project-id"
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.user_service_cluster.name
}
