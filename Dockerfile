#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER tobiaspedersen <>

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget nano dnsutils && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Define working directory.
WORKDIR /

# Set environment variables.
ENV HOME /root

ENV ZONE ""

ENV SERVER ""

ENV KEY ""

ENV NUMHOST ""

ENV HOST1 ""
ENV HOST2 ""
ENV HOST3 ""
ENV HOST4 ""
ENV HOST5 ""
ENV HOST6 ""
ENV HOST7 ""
ENV HOST8 ""
ENV HOST9 ""
ENV HOST10 ""

ENTRYPOINT ["./ddns.sh"]
