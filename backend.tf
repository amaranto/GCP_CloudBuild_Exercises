terraform {
  backend "gcs" {
    bucket  = "interview-tt"
    prefix  = "stg"
  }
}