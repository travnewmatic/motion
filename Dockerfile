FROM debian

RUN apt update && apt install -y motion
COPY motion.conf /etc/motion/motion.conf
COPY motion /etc/default/motion

EXPOSE 8081
EXPOSE 8080

CMD motion
