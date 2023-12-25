output "mig_instance_ips" {
  description = "The IP addresses of instances in the Managed Instance Group"
  value       = google_compute_instance_group_manager.ej1.instances[*].network_interface[0].access_config[0].nat_ip
}