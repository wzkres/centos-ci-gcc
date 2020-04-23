FROM centos:latest

LABEL maintainer="wzkres" \
        description="CentOS 8 CI build slave image with gcc, git, cmake for c/c++ projects"

RUN curl -o /etc/yum.repos.d/nasm.repo https://www.nasm.us/nasm.repo

RUN yum -y update && yum -y install \
        gcc gcc-c++ glibc-devel \
        nasm libtool make cmake git
        
RUN yum clean all
