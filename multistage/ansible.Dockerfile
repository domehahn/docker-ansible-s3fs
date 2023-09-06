ARG ALPINE_VERSION=3.18.3
ARG MULTISTAGE_IMAGE

FROM $MULTISTAGE_IMAGE:latest as builder

FROM alpine:$ALPINE_VERSION

COPY --from=builder /app /app

COPY ../ansible .

ENV S3FS_MOUNT=/opt/s3fs/bucket

VOLUME $S3FS_MOUNT

ENTRYPOINT ["/entrypoint.sh"]