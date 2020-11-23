FROM ubuntu:bionic

ADD json2yaml /usr/local/bin/json2yaml
ENV DEBIAN_FRONTEND=noninteractive

ENV TZ='Australia/Sydney'
RUN echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    apt-get -y upgrade git && \
    apt-get -y install \
        iputils-ping \
# 	bind-tools curl wget nmap procps tcpdump busybox-extras mtr openssh-client postgresql-client mysql-client rsync jq git iputils lftp netcat-openbsd socat iproute2 net-tools bash perl-net-telnet iperf3 ethtool apache2-utils \
        openjdk-8-jdk \
        ca-certificates \
        groff \
        vim \
        less \
        bash-completion \
        make \
        curl \
        wget \
        zip \
        telnet \
        git \
        tree \
        openssl \
        gcc \
        jq \
        tmux \
        golang-cfssl \
        gettext \
        python3 \
        python3-pip \
	      bash-completion \
        tzdata && \
    apt-get clean && \
    pip3 install --no-cache-dir --upgrade \
        awscli==1.17.8 \
        aws-sam-cli==0.37.0 \
        sceptre==2.3.0 \
        troposphere==2.5.3 \
        cfn-flip==1.2.2 \
        colorama==0.3.9 \
        boto3==1.14.47 \
        botocore==1.17.47 \ &&
    chmod +x /usr/local/bin/json2yaml

RUN echo "export LC_ALL=C.UTF-8" >> /root/.bashrc && \
    echo "export LANG=C.UTF-8"   >> /root/.bashrc && \
    echo 'export PS1="\u@\h:\w \$ "' >> /root/.bashrc && \
    echo 'export PATH=/root/bin:$PATH' >> /root/.bashrc && \
    echo 'export PATH=$PATH:/root/dev-cheats/' >> /root/.bashrc && \
    echo "alias dep='kubectl get deploy'" >> /root/.bashrc && \
    echo "alias ing='kubectl get ing'" >> /root/.bashrc && \
    echo "alias svc='kubectl get svc'" >> /root/.bashrc && \
    echo "alias pods='kubectl get pods'" >> /root/.bashrc && \
    echo "alias k=kubectl" >> /root/.bashrc && \
    echo 'alias ap="kubectl get pods --all-namespaces"' >> /root/.bashrc && \
    echo "alias po='kubectl get pods'" >> /root/.bashrc && \
    git config --global alias.co checkout && \
    git config --global alias.br branch && \
    git config --global alias.st status

WORKDIR /src
