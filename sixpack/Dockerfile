FROM python:2.7.13
MAINTAINER Shane Burkhart <shane@trysparkschool.com>

ADD . /app

RUN pip install gunicorn
RUN pip install gevent
RUN pip install sixpack==2.1.0

ENV SIXPACK_CONFIG /app/config.yml
