
output "mig_instance_group" {
  description = "Instace group self link"
  value       = google_compute_instance_group_manager.ej1.instance_group
}

