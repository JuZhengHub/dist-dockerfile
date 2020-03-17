FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

MAINTAINER zhengju@nuctech.com

# add tsinghua
COPY proxy/sources.list /etc/apt/sources.list
COPY proxy/.pip/ /root/.pip/

RUN rm -rf /etc/apt/sources.list.d/* && apt-get clean && apt-get update && \
    apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
    build-essential software-properties-common cmake git wget curl vim g++-4.8 ca-certificates cifs-utils nfs-common \
    python-dev python3-dev python-setuptools python3-setuptools python-pip python3-pip python-opencv \
    libjpeg-dev libpng-dev udev libcap2 && \
    rm -rf /etc/apt/sources.list.d/* 

# Download and install Mellanox OFED 5.0-1.0.0.0 for Ubuntu 16.04
#RUN wget http://content.mellanox.com/ofed/MLNX_OFED-5.0-1.0.0.0/MLNX_OFED_LINUX-5.0-1.0.0.0-ubuntu16.04-x86_64.tgz && \
# COPY ./MLNX_OFED_LINUX-5.0-1.0.0.0-ubuntu16.04-x86_64.tgz /root
# RUN cd /root && tar -xzvf MLNX_OFED_LINUX-5.0-1.0.0.0-ubuntu16.04-x86_64.tgz && \
RUN wget http://content.mellanox.com/ofed/MLNX_OFED-5.0-1.0.0.0/MLNX_OFED_LINUX-5.0-1.0.0.0-ubuntu16.04-x86_64.tgz && \
    tar -xzvf MLNX_OFED_LINUX-5.0-1.0.0.0-ubuntu16.04-x86_64.tgz && \
    MLNX_OFED_LINUX-5.0-1.0.0.0-ubuntu16.04-x86_64/mlnxofedinstall --user-space-only --without-fw-update --all -q && \
    cd .. && \
    rm -rf ${MOFED_DIR} && \
    rm -rf *.tgz



 				





