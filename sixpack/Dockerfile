FROM python:2.7.13
MAINTAINER Shane Burkhart <shane@trysparkschool.com>

RUN mkdir -p /home/sixpack
WORKDIR /home/sixpack
RUN git clone https://github.com/seatgeek/sixpack

WORKDIR /home/sixpack/sixpack
RUN pip install -r requirements.txt

ADD ./config.yml /home/sixpack/sixpack/config.yml

ENV SIXPACK_CONFIG /home/sixpack/sixpack/config.yml
ENV PYTHONPATH /home/sixpack/sixpack
