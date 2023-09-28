FROM jdk17 as builder

RUN mkdir ansible

COPY ./multistage/ansible ansible

FROM alpine

COPY --from=builder ansible ansible

ENV S3FS_MOUNT=/opt/s3fs/bucket

VOLUME $S3FS_MOUNT

RUN apk upgrade --no-cache && \
    apk add ansible && \
    rm -rf /var/cache/apk/*

COPY ./multistage/entrypoint.sh ./ansible

WORKDIR ansible

ENTRYPOINT ["./entrypoint.sh"]