resource "google_compute_address" "static" {
  count = var.vm_is_public ? 1 : 0
  name = "ipv4-address"
  region = var.vm_region
}

resource "google_service_account" "ej1" {
  account_id   = "${var.vm_name}-sa"
  display_name = "SA ${var.vm_name}"
}

resource "google_service_account_key" "ej1" {
  service_account_id = google_service_account.ej1.name
  public_key_type    = local.default_pubkey
}

resource "google_os_login_ssh_public_key" "cache" {
  for_each = { 
    for idx, user in var.vm_users :
    user.email => user
  }
  project = var.project_id
  user =  each.value.email
  key = try(each.value.pubkey, file("${path.module}/files/default.pub"))
}

resource "google_project_iam_member" "project" {
  for_each = { 
    for idx, user in var.vm_users :
    user.email => user
  }
  project = var.project_id
  role    = "roles/compute.osAdminLogin"
  member  = "user:${each.value.email}"
}

resource "google_project_iam_member" "project_viewer" {
  for_each = toset(var.project_editor_users)
  project = var.project_id
  role    = "roles/viewer"
  member  = "user:${each.value}"
}

resource "google_project_iam_member" "project_editor" {
  for_each = toset(var.project_editor_users)

  project = var.project_id
  role    = "roles/editor"
  member  = "user:${each.value}"
}

resource "google_compute_instance_template" "ej1" {
  name        = "appserver-template-${var.vm_name}"
  description = "Template for interview challenge"

  tags = ["interview"]

  labels = {
    environment = "stg"
  }

  instance_description = "instance generated by ej1 module"
  machine_type         = var.vm_size
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image      = var.vm_disk.image 
    auto_delete       = var.vm_disk.auto_delete
    boot              = var.vm_disk.boot
  }

  network_interface {
    network = "default"

    dynamic "access_config" {
      for_each = var.vm_is_public ? [1] : []
      content {
        nat_ip = google_compute_address.static[0].address
      }
    }    
  }

  metadata = {
    interview = "true"
    sysprep-specialize-script-cmd = "googet -noconfirm=true install google-compute-engine-ssh"
    enable-windows-ssh = "TRUE"
    enable-oslogin: "TRUE"    
    windows-startup-script-ps1= file("${path.module}/scripts/startup.ps1")
    ssh-keys = <<-EOT
    %{ for u in var.vm_ssh_users ~}
      ${u["username"]}:${try(u["pubkey"], file("${path.module}/files/default.pub"))} 
    %{ endfor ~}
    EOT
  }

  service_account {
    email  = google_service_account.ej1.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance_group_manager" "ej1" {
  name     = "mig-${var.vm_name}"

  base_instance_name = var.vm_name
  zone               = var.vm_zone

  target_size = 1

  version {
    name              = "${var.vm_name}-v1"
    instance_template = google_compute_instance_template.ej1.self_link_unique
  }

}

resource "google_compute_firewall" "ssh-rule" {
  name = "allow-ssh-to-${var.vm_name}"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  target_tags = ["interview"]
  source_ranges = ["0.0.0.0/0"]
}