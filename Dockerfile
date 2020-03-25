FROM centos:8

RUN yum -y update

RUN yum -y install \
        autoconf automake binutils \
        gcc gcc-c++ glibc-devel \
        libtool make cmake \
        pkgconfig pkgconf-m4 pkgconf-pkg-config \
        git && yum clean all
