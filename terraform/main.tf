terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  credentials = file("../keys/terraform-key.json")
  project     = "medicare-analysis-45210" 
  region      = "us-central1"
}

# 1. The Data Lake (GCS Bucket) - For RAW data
resource "google_storage_bucket" "medicare_lake" {
  name          = "medicare-lake-${var.project_id}" # Must be unique
  location      = "US"
  force_destroy = true 

  # Best Practice: Prevent public access to your data
  public_access_prevention = "enforced"
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 30 # Auto-delete raw files after 30 days to save costs
    }
    action {
      type = "Delete"
    }
  }
}

# 2. The Data Warehouse (BigQuery Dataset) - For PROCESSED data
resource "google_bigquery_dataset" "medicare_dataset" {
  dataset_id = "medicare_data"
  location   = "US"
  description = "Dataset for Medicare Monthly Enrollment analytics"
}

variable "project_id" {
  description = "The GCP Project ID"
  default     = "medicare-analysis-45210" 
}