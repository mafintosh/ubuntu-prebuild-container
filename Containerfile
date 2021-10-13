FROM ubuntu:xenial
RUN rm -f /etc/resolv.conf && echo '8.8.8.8' > /etc/resolv.conf
RUN echo deb http://ports.ubuntu.com/ xenial main restricted > /etc/apt/sources.list \
  && echo deb http://ports.ubuntu.com/ xenial universe >> /etc/apt/sources.list \
  && echo deb http://ports.ubuntu.com/ xenial multiverse >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git vim curl build-essential wget bash-completion screen man libtool \
  autoconf automake python help2man python-setuptools python3
RUN curl -fs https://raw.githubusercontent.com/mafintosh/node-install/master/install | sh \
  && node-install 14
ENV UBUNTU_HOSTNAME="$(hostname)"
RUN adduser --disabled-password --gecos "" ubuntu && echo root:qweqwe | chpasswd \
  && echo ubuntu:qweqwe | chpasswd \
  && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /tmp/container-user \
  && mv /tmp/container-user /etc/sudoers.d/container-user \
  && chown ubuntu:ubuntu -R /home/ubuntu \
  && echo 127.0.0.1 container.img >> /etc/hosts
COPY prebuild.sh /home/ubuntu/prebuild.sh
USER ubuntu
CMD /home/ubuntu/prebuild.sh