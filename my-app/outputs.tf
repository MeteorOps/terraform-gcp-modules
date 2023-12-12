output "ip" {
  value = google_compute_instance.my_app_instance.network_interface.0.access_config.0.nat_ip
}