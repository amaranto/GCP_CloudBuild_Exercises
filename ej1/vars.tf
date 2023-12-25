variable "vm_name"{
  type        = string
}

variable "project_id" {
  type        = string
}

variable "vm_is_public"{
  type        = bool
  default     = false
}

variable "vm_size" {
  type        = string
  default     = "n1-standard-2"
}

variable "vm_zone"{
  type        = string
  default     = "us-central1-a"
}

variable "vm_region"{
  type        = string
  default     = "us-central1"
}

variable "vm_disk" {
  type        = map
  default     = {
    "type" = "pd-ssd"
    "size" = "100"
    "auto_delete" = "true"
    "boot" = "true"
    "image" = "windows-2019"
    "family" = "windows-2019"
  }
}

variable "vm_ssh_users" {
  type = list
  default = [
    {
      "username" = "default"
    }
  ]
}

variable "vm_users" {
  type = list
  default = [
    {
      "email" = "eze.m.arevalo@gmail.com"
    }
  ]
}

variable "project_editor_users" {
  type = list
  default = []
}