# This is a Dockerfile for the rhel/jdk:1.0 image.

FROM registry.access.redhat.com/rhel7:latest

MAINTAINER Robert Baumgartner <robert.bumgartner@redhat.com>

# Environment variables
ENV IMAGE_NAME="rhel/jdk" \
    IMAGE_VERSION="1.0" \
    JAVA_HOME="/usr/lib/jvm/java-1.8.0" \
    JAVA_VENDOR="oracle" \
    JAVA_VERSION="1.8.0" 

# Labels
LABEL name="$IMAGE_NAME" \
      version="$IMAGE_VERSION" \
      architecture="x86_64" \
      java_version="$JAVA_VERSION" \
      java_vendor="$JAVA_TYPE" \
      description="Base image with OracleJDK 8 on RHEL 7"

ENV JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-${JAVA_TYPE}

#         --enablerepo=rhel-7-server-extras-rpms \
#         --enablerepo=rhel-7-server-optional-rpms \
#       java-${JAVA_VERSION}-${JAVA_TYPE}-jdbc && \


RUN yum --disablerepo=* \
        --enablerepo=rhel-7-server-rpms \
        --enablerepo=rhel-7-server-thirdparty-oracle-java-rpms \
      install -y \
      java-$JAVA_VERSION-$JAVA_TYPE-devel \
    yum clean all && \
    rpm -q  java-${JAVA_VERSION}-${JAVA_TYPE}-devel && \
    java -version
