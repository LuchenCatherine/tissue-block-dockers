FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER lu.chen.3@stonybrook.edu

RUN apt-get update
# compiler
RUN apt-get install -y build-essential libssl-dev
# cmake
RUN apt-get install -y cmake
# boost
RUN apt-get install -y libboost-all-dev
# GMP
RUN apt-get install -y libgmp-dev
# MPFR
RUN apt-get install -y libmpfr-dev
# eigen3
RUN apt install -y libeigen3-dev
# CGAL
RUN apt-get install -y libcgal-dev
# cpprestsdk
RUN apt-get install -y libcpprest-dev

# copy data
# COPY data/plain_filling_hole /usr/data
# COPY data/ASCT-B_3D_Models_Mapping.csv /usr/data
# COPY data/organ_origins_meter.csv /usr/data

# # copy src
# COPY src/collision_detection_http_service /usr/src

# copy
COPY . .
WORKDIR /src/collision_detection_http_service
RUN mkdir build

WORKDIR build 
RUN cmake .. && make
