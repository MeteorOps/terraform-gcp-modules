output "bucket" {
  description = "Bucket resource (for single use)."
  value       = local.first_bucket
}

output "name" {
  description = "Bucket name (for single use)."
  value       = local.first_bucket.name
}

output "url" {
  description = "Bucket URL (for single use)."
  value       = local.first_bucket.url
}

output "buckets" {
  description = "Bucket resources as list."
  value       = local.buckets_list
}

output "buckets_map" {
  description = "Bucket resources by name."
  value       = google_storage_bucket.buckets
}

output "names" {
  description = "Bucket names."
  value = { for name, bucket in google_storage_bucket.buckets :
    name => bucket.name
  }
}

output "urls" {
  description = "Bucket URLs."
  value = { for name, bucket in google_storage_bucket.buckets :
    name => bucket.url
  }
}

output "names_list" {
  description = "List of bucket names."
  value       = local.buckets_list[*].name
}

output "urls_list" {
  description = "List of bucket URLs."
  value       = local.buckets_list[*].url
}
