FROM python:3.10.0b1-alpine3.13

RUN apk add --update
RUN pip install flask python-logstash-async

WORKDIR APP
COPY main.py .
EXPOSE 5000
CMD [ "python", "./main.py" ]