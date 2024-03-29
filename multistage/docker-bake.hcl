variable "TAG" {
  default = "latest"
}

target "docker-metadata-action" {
  tags = ["aboutdevops/jdk17-ansible-s3fs:${TAG}"]
}

group "default" {
  targets = ["ansible"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  contexts = {
    jdk17  = "docker-image://eclipse-temurin:17-focal"
    alpine = "docker-image://alpine:3.18.3"
  }
  cache-to   = ["type=inline"]
  dockerfile  = "./multistage/ansible.Dockerfile"
  output     = ["type=registry"]
}

target "ansible" {
  inherits  = ["image"]
  platforms = ["linux/amd64", "linux/arm64"]
  output    = ["type=registry"]
}