FROM ubuntu:bionic

ADD json2yaml /usr/local/bin/json2yaml

RUN apt-get update && \
    apt-get install -y \
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
        gettext \
        python3 \
        python3-pip && \
    pip3 install --no-cache-dir --upgrade \
         sceptre>=2.1.3 \
         troposphere>=2.0.0 \
         awscli && \
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