FROM centos:6
MAINTAINER Sergey Korytnikov "sergey.korytnikov@gmail.com"

# Install utils
RUN yum -y install \
	curl \
	which \
	tar \
	sudo \
	openssh-server \
	openssh-clients \
	rsync \
	initscripts \
	unzip \
	python-setuptools && \
	yum clean all

# Install supervisord
RUN easy_install pip && \
	pip install supervisor

COPY rpm/python-meld3-0.6.7-1.el6.x86_64.rpm /tmp/python-meld3-0.6.7-1.el6.x86_64.rpm
RUN rpm -Uvh /tmp/python-meld3-0.6.7-1.el6.x86_64.rpm
RUN rm -f /tmp/python-meld3-0.6.7-1.el6.x86_64.rpm
	
# SSH setup
COPY generic/etc/ssh/ssh_config /etc/ssh/ssh_config
RUN ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa && \
    cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys && \
    service sshd start && \
    ssh -o StrictHostKeyChecking=no localhost true && \
    service sshd stop

COPY generic/etc/supervisord.conf /etc/supervisord.conf

# Setup /etc/bootstrap.sh
COPY generic/etc/bootstrap.sh /etc/bootstrap.sh

RUN mkdir -p /var/run/
RUN mkdir -p /var/log/
RUN mkdir -p /var/log/supervisord

EXPOSE 22
ENTRYPOINT ["/etc/bootstrap.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

