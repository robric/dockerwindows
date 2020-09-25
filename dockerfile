FROM centos:latest
RUN yum update -y \
  && yum install -y \
  sudo \
  git \
  openssh-server \
  && yum clean all
RUN dnf install -y epel-release 
RUN dnf makecache
RUN dnf install -y ansible                                                                                                                                                                                                  
RUN ssh-keygen -A
RUN mkdir /var/run/sshd
RUN echo "root:root123" | chpasswd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN mkdir drive
VOLUME drive
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]