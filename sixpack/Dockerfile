FROM python:2.7.13
MAINTAINER Shane Burkhart <shane@trysparkschool.com>

ADD . /app

RUN pip install gunicorn
RUN pip install gevent
RUN pip install sixpack

ENV SIXPACK_CONFIG /app/config.yml

CMD ["gunicorn", "-b 0.0.0.0:8000", "--access-logfile", "-", "-w 8", "--worker-class=gevent", "sixpack.server:start"]
