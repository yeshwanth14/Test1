provider "google" {
 project        = "ethereal-terra-279604"
 credentials    = "${file("credentials/secrets.json")}"
 region         = "us-central1-a"
 }
resource "google_container_cluster" "cluster" {
  name               = "demo-cluster"
  location           = "us-central1-a"
  network            = "default"
  subnetwork         = "default"
  initial_node_count = 2
  master_auth {
    username = "rapid"
    password = "admin#jenkins#123"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
  workload_identity_config {
  identity_namespace = "${var.project}.svc.id.goog"
}

node_pool {
    name       = "default-pool"
    node_count = 2
    
    
    management {
    auto_repair  = true
    auto_upgrade = true
    
  }


 
 node_config {
    preemptible  = true
    machine_type = "n1-standard-2"
    
  

 
  oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

  shielded_instance_config {
              
    enable_secure_boot          = true
    }
 
  }
 
  
 }
}
