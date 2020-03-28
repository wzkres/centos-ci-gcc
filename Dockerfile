FROM centos:8

LABEL maintainer="wzkres" \
        description="CentOS 8 CI build slave image with gcc, git, cmake for c/c++ projects"

RUN yum -y update && yum -y install \
        autoconf automake \
        gcc gcc-c++ glibc-devel \
        libtool make cmake \
        pkgconfig pkgconf-m4 pkgconf-pkg-config \
        git && yum clean all
