FROM debian

RUN apt update && apt install -y motion

EXPOSE 8081
