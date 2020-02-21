data "google_container_engine_versions" "engine_version" {
  project                   = var.project_id
  location                  = var.zone
}

resource "google_container_node_pool" "pool-nodes" {
  provider = google-beta
  name       = "pool-nodes"
  location   = var.zone
  cluster    = var.cluster_name
  node_count = var.node_count
  project    = var.project_id
//  version    = data.google_container_engine_versions.engine_version.latest_node_version
  version    = var.node_version


  autoscaling {
    max_node_count = var.autoscaling_max_node_count
    min_node_count = var.autoscaling_min_node_count
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    # The set of Google API scopes to be made available on all of the node VMs
    # under the "default" service account. These can be either FQDNs, or scope
    # aliases. The cloud-platform access scope authorizes access to all Cloud
    # Platform services, and then limit the access by granting IAM roles
    # https://cloud.google.com/compute/docs/access/service-accounts#service_account_permissions
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

  }
}