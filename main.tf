provider "docker" {
  alias = "local"
  host  = "tcp://localhost:2375"
}

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_container" "web_server" {
  provider = docker.local
  name     = "web_server"
  image    = "nginx:latest"
  ports {
    internal = 80
    external = 8080
  }
}
