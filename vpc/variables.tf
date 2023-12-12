variable "project_id" {
  description = "The project ID to host the network in"
}

variable "network_name" {
  description = "The name of the VPC network being created"
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}
