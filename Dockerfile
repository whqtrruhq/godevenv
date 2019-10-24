FROM ubuntu:bionic as baseos
MAINTAINER whqtrruhq <whqtrruhq@protonmail.com>
#
ENV  GO_VERSION=1.13.3
#
WORKDIR /tmp
#
RUN  sed -i -e 's/^deb-src/#deb-src/' /etc/apt/sources.list \
     && export DEBIAN_FRONTEND=noninteractive \
     && apt-get update \
     && apt-get upgrade -y --no-install-recommends \
     && apt-get install -y --no-install-recommends \
     apt-transport-https \
     bash \
     bash-completion \
     build-essential \
     ca-certificates \
     ctags \
     curl \
     dnsutils \
     git-core \
     git \
     gnupg2 \
     htop \
     iproute2 \
     iputils-ping \
     less \
     locales \
     lynx \
     mtr \
     netcat \
     net-tools \
     nmap \
     openssh-client \
     p7zip-full \
     software-properties-common \
     tmux \
     && locale-gen en_US.UTF-8 
#
RUN add-apt-repository ppa:neovim-ppa/stable \
     && apt-get update && apt-get install -y \
     neovim
#
RUN curl -L https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz | tar -C /usr/local -xz 
#
RUN apt-get autoremove -y \
     && apt-get clean -y \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc   
#
RUN useradd -ms /bin/bash -u 1000 whqtrruhq 
#
USER whqtrruhq 
#
WORKDIR /home/whqtrruhq
#
RUN git clone https://github.com/whqtrruhq/dotfiles.git
#
RUN /home/whqtrruhq/dotfiles/install.sh
#
CMD ["bash"]
#
EXPOSE 3000/tcp
