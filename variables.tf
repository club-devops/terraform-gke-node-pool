variable "name" {
  description = "The name of the Node Pool"
}

variable "project_id" {
  description = "Project Id"
}


variable "zone" {
  description = "In which zone to create the Node Pool"
}

variable "node_count" {
  description = "The number of nodes to create in this Node Pool"
  default     = 1
}

variable "cluster_name" {
  description = "Name of the cluster to which to add this Node Pool"
}

variable "machine_type" {
  description = "The type of machine to use for hub pool"
  default     = "n1-standard-4"
}

variable "autoscaling_max_node_count" {
  description = "Max node count in the pool"
  default = 250
}

variable "autoscaling_min_node_count" {
  description = "Min node count in the pool"
  default = 1
}

variable "disk_size_gb" {
  description = "Disk of which size to attach to the nodes in the pool "
  default     = "10"
}

