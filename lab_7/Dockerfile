FROM ubuntu:latest


RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN apt-get install python3.7 -y

ADD . /app
WORKDIR /app

CMD ["python3", "main.py"]
