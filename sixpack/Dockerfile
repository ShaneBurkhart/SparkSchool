FROM python:2.7.13
MAINTAINER Shane Burkhart <shane@trysparkschool.com>

ADD . /app

RUN pip install sixpack=2.0.4

ENV SIXPACK_CONFIG /app/config.yml
ENV URL = sixpack.trysparkschool.com
