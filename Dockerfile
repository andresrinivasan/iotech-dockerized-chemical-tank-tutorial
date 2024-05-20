FROM ubuntu-vm:latest

RUN apt-get install librxtx-java

WORKDIR /root
COPY install-arch-packages.sh .

RUN sh ./install-arch-packages.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]
