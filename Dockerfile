FROM registry.access.redhat.com/rhel7:latest

MAINTAINER Robert Baumgartner <robert.bumgartner@redhat.com>

ENV JAVA_VERSION=1.8.0 \
    JAVA_TYPE=oracle
    
LABEL java_version="${JAVA_VERSION}" java_vendor="${JAVA_TYPE}"

ENV JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-${JAVA_TYPE}

#         --enablerepo=rhel-7-server-rpms \
#         --enablerepo=rhel-7-server-extras-rpms \
#         --enablerepo=rhel-7-server-optional-rpms \

RUN yum --disablerepo=* \
        --enablerepo=rhel-7-server-thirdparty-oracle-java-rpms \
      install -y \
      java-${JAVA_VERSION}-${JAVA_TYPE}-devel \
      java-${JAVA_VERSION}-${JAVA_TYPE}-jdbc && \
    yum clean all && \
    java -version
