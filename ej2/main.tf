resource "google_container_registry" "registry" {
  project  = var.project_id
  location = var.gcr.location
}

resource "google_storage_bucket_iam_member" "viewer" {
  for_each = toset(var.project_users)
  bucket = google_container_registry.registry.id
  role = "roles/storage.objectViewer"
  member = "user:${each.value}"
}


