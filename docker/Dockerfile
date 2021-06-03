FROM python:3.10.0b1-alpine3.13

RUN apk add --update
RUN apk add git
RUN pip install flask python-logstash-async

WORKDIR APP

RUN git clone https://github.com/vanessakovalsky/example-python/tree/master/vagrant/src .

EXPOSE 5000
CMD [ "python", "./main.py" ]