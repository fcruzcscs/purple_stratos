job "test" {
  datacenters = ["dc1"]
  type        = "service"

  group "managed test" {
    count = 1

    network {
        port "p_nginx" { to = "80" }
    }

    task "nginx" {
      driver = "podman"

      config {
        image = "docker://docker.io/nginx"
        ports = [ "p_nginx"  ]
      }

      resources {
        cpu    = 300
        memory = 300
      }
    }
  }
}
