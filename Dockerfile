FROM ubuntu:20.04

RUN apt-get update -y

RUN apt-get install -y --no-install-recommends tzdata

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y --no-install-recommends build-essential cmake make git
RUN apt-get install -y --no-install-recommends protobuf-compiler protobuf-compiler-grpc libprotobuf-dev libgrpc++-dev

RUN useradd -ms /bin/bash dev
USER dev
WORKDIR /home/dev
