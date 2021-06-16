FROM debian

RUN apt update && apt install -y motion
COPY motion.conf /etc/motion/motion.conf
COPY motion /etc/default/motion

CMD motion

EXPOSE 8081
