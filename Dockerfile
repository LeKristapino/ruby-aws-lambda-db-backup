FROM amazonlinux:2017.03

RUN yum -y install git \
    zip \
    gcc \
    openssl-devel \
    bzip2-devel \
    libffi-devel \
    wget \
    && yum clean all

RUN yum -y install postgresql96
WORKDIR /app

COPY . /app
