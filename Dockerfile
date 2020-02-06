FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y maven git docker.io && \
    chmod +x build.sh

CMD ["./build.sh"]

