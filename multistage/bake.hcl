# bake.hcl
group "default" {
  targets = ["ansible"]
}

target "ansible" {
    contexts = {
        jdk17 = "docker-image://eclipse-temurin:17-focal"
        alpine = "docker-image://alpine:3.18.3"
    }
    dockerfile = "ansible.Dockerfile"
    tags = ["devilluminati/jdk17-ansible-s3fs:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
    output = ["type=registry"]
}