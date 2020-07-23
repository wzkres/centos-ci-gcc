FROM centos:7.8.2003

LABEL maintainer="wzkres" \
        description="CentOS 7 CI build slave image with gcc, git, cmake for c/c++ projects"
        
RUN yum -y update && yum -y install epel-release && yum -y install centos-release-scl
RUN yum -y install wget devtoolset-8 automake libtool autoconf cmake cmake3 git

RUN scl enable devtoolset-8 bash

RUN alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake 10
RUN alternatives --install /usr/local/bin/cmake cmake /usr/bin/cmake3 20

# Compile NASM
RUN wget https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.gz && \
  tar zxvf nasm-2.13.03.tar.gz && \
  cd nasm-2.13.03 && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -rf nasm-2.13.03 && \
  rm -rf nasm-2.13.03.tar.gz

RUN yum clean all

ENTRYPOINT ["/usr/bin/scl", "enable", "devtoolset-8", "--"]
CMD ["/usr/bin/scl", "enable", "devtoolset-8", "--", "/bin/bash"]
