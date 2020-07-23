FROM centos:7.8.2003

LABEL maintainer="wzkres" \
        description="CentOS 7 CI build slave image with gcc, git, cmake for c/c++ projects"

RUN yum -y update && yum -y install \
        gcc gcc-c++ glibc-devel \
        nasm libtool make cmake cmake3 git

RUN alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake 10
RUN alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake3 20

RUN yum clean all
