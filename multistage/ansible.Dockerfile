FROM jdk17 as builder

FROM alpine

COPY . ../ansible

ENV S3FS_MOUNT=/opt/s3fs/bucket

VOLUME $S3FS_MOUNT

ENTRYPOINT ["/entrypoint.sh"]