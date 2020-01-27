resource "google_container_node_pool" "pool-nodes" {
  provider = google-beta
  name       = "pool-nodes"
  location   = var.zone
  cluster    = var.cluster_name
  node_count = var.node_count
  project    = var.project_id

  autoscaling {
    max_node_count = var.autoscaling_max_node_count
    min_node_count = var.autoscaling_min_node_count
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
  }
}