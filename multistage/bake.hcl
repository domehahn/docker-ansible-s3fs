# bake.hcl
group "default" {
  targets = ["ansible"]
}

target "ansible" {
    args = {
        MULTISTAGE_IMAGE="eclipse-temurin:17-focal"
    }
    dockerfile = "ansible.Dockerfile"
    tags = ["devilluminati/jdk-ansible-s3fs:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
    output = ["type=registry"]
}