FROM ubuntu:20.04
MAINTAINER Ddnirvana "ddnirvana1@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

## Normal depencies
RUN apt-get -qq update && apt-get install -y apt-utils curl vim git build-essential net-tools iputils-ping pciutils iperf iperf3 openssh-server wget ethtool fuse libfuse-dev psmisc tmux; 

## Dependices of buiding Isulad
RUN apt install -y g++ libprotobuf-dev protobuf-compiler protobuf-compiler-grpc libgrpc++-dev libgrpc-dev libtool automake autoconf cmake make pkg-config libyajl-dev zlib1g-dev libselinux1-dev libseccomp-dev libcap-dev libsystemd-dev git libarchive-dev libcurl4-gnutls-dev openssl libdevmapper-dev python3 libtar0 libtar-dev libhttp-parser-dev libwebsockets-dev;

RUN cp /usr/include/fuse /usr/local/include/ -r

RUN apt-get -qq update && apt-get install -y sudo;

COPY mypasswd /home/

RUN useradd --no-log-init -r -m -g root stu

COPY README.md /home/stu/

RUN cat /home/mypasswd | chpasswd

RUN apt-get install -y python python3;

RUN apt-get install -y zsh ctags sloccount cmake;

RUN apt-get install -y python3-pip zip;

USER stu

#$VOLUME ["/root"]
WORKDIR /home/stu/
