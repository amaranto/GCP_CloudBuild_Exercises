terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  project     = "earevalo-89"
  region      = "us-east1"
  }