FROM python:3.10.0b1-alpine3.13

RUN apk add --update
RUN pip install flask python-logstash-async
RUN apk add wget

WORKDIR APP
RUN wget -O /APP/main.py https://github.com/vanessakovalsky/example-python/raw/master/vagrant/src/main.py
RUN chmod +x /APP/main.py

EXPOSE 3002
ENTRYPOINT FLASK_APP=/APP/main.py flask run --host=0.0.0.0 --port=3002

