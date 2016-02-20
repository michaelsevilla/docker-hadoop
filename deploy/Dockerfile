FROM sequenceiq/hadoop-docker:2.7.1

MAINTAINER Michael Sevilla

# install deps
RUN echo "===> Installing jxio stuff..."  && \
    DEBIAN_FRONTEND=noninteractive yum update -y && \
    yum groupinstall "Infiniband Support" -y 
RUN yum install -y \
        git \
        gcc-c++ \
        java-1.7.0-openjdk-devel \
	libtool \
        autoconf \
        automake \
	infiniband-diags \
        perftest \
        libibverbs-utils \
        librdmacm-utils \
	librdmacm-devel \
        libibverbs-devel \
        numactl \
        numactl-devel \
        libaio-devel \
        libevent-devel 

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.95.x86_64/
RUN echo "===> Build jxio..." && \
    cd / && \
    git clone https://github.com/accelio/JXIO.git && \
    cd /JXIO && \
    git clean -fd && \
    ./build.sh
