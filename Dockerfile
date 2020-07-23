FROM centos:7.8.2003

LABEL maintainer="wzkres" \
        description="CentOS 7 CI build slave image with gcc, git, cmake for c/c++ projects"
        
RUN yum -y update && yum -y install epel-release
RUN yum -y install \
        wget gcc gcc-c++ glibc-devel \
        libtool make cmake cmake3 git

RUN alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake 10
RUN alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake3 20

# Compile NASM
RUN wget https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.bz2 && \
  tar xjvf nasm-2.13.03.tar.bz2 && \
  cd nasm-2.13.03 && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf nasm-2.13.03 && \
  rm -rf nasm-2.13.03.tar.bz2

RUN yum clean all
