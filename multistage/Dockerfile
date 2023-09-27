FROM eclipse-temurin:17-focal as builder

RUN mkdir ansible

COPY ansible ansible

FROM alpine:3.18.3

COPY --from=builder ansible ansible

ENV S3FS_MOUNT=/opt/s3fs/bucket

VOLUME $S3FS_MOUNT

RUN apk upgrade --no-cache && \
    apk add ansible && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh ./ansible

WORKDIR ansible

ENTRYPOINT ["./entrypoint.sh"]