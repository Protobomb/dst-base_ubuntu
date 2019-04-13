FROM ubuntu:latest

ARG new_user

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    curl \
    unzip \
    groff \
    sudo \
    git \
    vim \
    python3 \
    python3-pip


# clean up repositories
RUN apt-get clean autoclean
RUN apt-get autoremove -y
RUN rm -Rf /var/lib/{apt,dpkg,cache,log}/

RUN useradd ${new_user} -d /home/${new_user}
RUN usermod -aG sudo ${new_user}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ${new_user}
