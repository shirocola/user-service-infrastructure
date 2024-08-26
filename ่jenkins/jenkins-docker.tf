resource "google_compute_instance" "jenkins" {
  name         = "jenkins-server"
  machine_type = "n1-standard-1"
  zone         = "asia-southeast1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["http-server", "https-server"]

  metadata_startup_script = <<-EOF
    #!/bin/bash
    docker run -d -p 8080:8080 -p 50000:50000 --name jenkins jenkins/jenkins:lts
  EOF
}
