FROM centos:7.8.2003

LABEL maintainer="wzkres" \
        description="CentOS 7 CI build slave image with gcc, git, cmake for c/c++ projects"

RUN yum -y update && yum -y install \
        gcc gcc-c++ glibc-devel \
        nasm libtool make cmake git
        
RUN yum clean all
