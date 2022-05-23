provider "docker" {
  host = "unix:///var/run/docker.sock"

  // https://docs.otc.t-systems.com/en-us/usermanual/swr/swr_01_1000.html
  registry_auth {
    address  = "<registry_url>"
    username = "<access_key>"
    password = "<secret_access_key>"
  }
}

data "docker_registry_image" "image" {
  name = "<registry_url>/rytle-test:latest"
}

resource "docker_image" "image" {
  name = data.docker_registry_image.image.name
  keep_locally = true

  pull_triggers = [
    data.docker_registry_image.image.sha256_digest
  ]
}