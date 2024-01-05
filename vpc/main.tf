module "vpc-module" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 3.3.0"
  project_id   = var.project_id
  network_name = var.network_name
  mtu          = 1460

  subnets = var.subnets
}
