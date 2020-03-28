FROM centos:latest

LABEL maintainer="wzkres" \
        description="CentOS 8 CI build slave image with gcc, git, cmake for c/c++ projects"

RUN yum -y update && rpm --rebuilddb && yum -y install \
        gcc gcc-c++ glibc-devel \
        libtool make cmake git
RUN rpm --rebuilddb && yum clean all
