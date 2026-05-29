# 1. Specify the required provider and version
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Uses the 5.x major version
    }
  }
}

# 2. Configure the Google Cloud Provider
provider "google" {
  project = "random-words-23478" # 👈 Replace with your GCP Project ID
  region  = "us-central1"
  zone    = "us-central1-a"
}


# 4. Create the Compute Engine Instance
resource "google_compute_instance" "vm_instance" {
  name         = "demo-zookeeper-ensemble-vm-001"
  machine_type = "e2-micro" # Cost-effective burstable instance
  zone         = "us-central1-a"

  # Define the OS Boot Disk
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10 # Size in GB
    }
  }

# ATTACH TO EXISTING SUBNET HERE
  network_interface {
    # Provide the exact name of your existing subnet
    subnetwork = "demonstration-subnet-private" 
  }

  # Optional: Add metadata or tags
  tags = ["zookeeper-ensemble", "demo"]

  labels = {
    environment = "demo"
    managed_by  = "terraform"
  }
}