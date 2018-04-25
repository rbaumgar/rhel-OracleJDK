# This is a Dockerfile for the rhel/jdk:1.0 image.

FROM registry.access.redhat.com/rhel7:latest

MAINTAINER Robert Baumgartner <robert.bumgartner@redhat.com>

# Environment variables
ENV IMAGE_NAME="rhel/jdk" \
    IMAGE_VERSION="1.1" \
    JAVA_HOME="/usr/java/default" \
    JAVA_VENDOR="oracle" \
    JAVA_VERSION="1.8.0" \
    ORACLE_JAVA_DOWNLOAD_URL=http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm

# Labels
LABEL name="$IMAGE_NAME" \
      version="$IMAGE_VERSION" \
      architecture="x86_64" \
      java_version="$JAVA_VERSION" \
      java_vendor="$JAVA_TYPE" \
      description="Base image with OracleJDK 8 on RHEL 7"

RUN curl -C - -L -O -# \
    -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    ${ORACLE_JAVA_DOWNLOAD_URL} && \
    rpm -ivh ./jdk-8u171-linux-x64.rpm && \
    java -version && \
    rm -f ./jdk-8u171-linux-x64.rpm
