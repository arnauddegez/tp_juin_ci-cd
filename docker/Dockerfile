FROM python:3.10.0b1-alpine3.13

RUN apk add --update
RUN pip install flask python-logstash-async
RUN apk add wget

WORKDIR APP
CMD [ "wget", "https://github.com/vanessakovalsky/example-python/raw/master/vagrant/src/main.py"]
COPY main.py .
EXPOSE 5000
CMD [ "python", "./main.py" ]