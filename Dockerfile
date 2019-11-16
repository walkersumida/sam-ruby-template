FROM ruby:2.5.1-stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHON_VERSION 3.6.0
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y git make wget \
build-essential \
libffi-dev \
libssl-dev \
zlib1g-dev \
libbz2-dev \
libreadline-dev \
libsqlite3-dev \
libncurses5-dev
RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz \
        && tar zxf Python-$PYTHON_VERSION.tgz \
        && cd Python-$PYTHON_VERSION \
        && ./configure \
        && make altinstall
ENV PYTHONIOENCODING "utf-8"

RUN pip3.6 install aws-sam-cli
RUN sam --version

WORKDIR /app
