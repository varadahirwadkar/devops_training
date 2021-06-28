terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.9.0"
    }
  }
}

provider "docker" {
  host = "tcp://localhost:2375"
}
