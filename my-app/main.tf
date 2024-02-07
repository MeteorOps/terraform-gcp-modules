data "google_compute_zones" "available" {
  project = var.project_id
  region = var.region
}

resource "google_compute_instance" "my_app_instance" {
  project      = var.project_id
  name         = "virtual-machine-from-terraform"
  machine_type = "e2-standard-2"
  zone         = data.google_compute_zones.available.names[0]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = var.network_subnet_name
    subnetwork_project = var.project_id
    nic_type = "VIRTIO_NET"


    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<h1>Contact <a href=\"https://www.meteorops.com/\">MeteorOps</a> for DevOps & Cloud Consulting!</h1>' | sudo tee /var/www/html/index.html"

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["my-app"]
}

resource "google_compute_firewall" "my_app_instance_fw" {
  project = var.project_id
  name    = "default-allow-http-terraform"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  // Allow traffic from everywhere to instances with a my-app tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["my-app"]
}
