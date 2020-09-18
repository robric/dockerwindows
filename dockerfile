FROM centos:latest
RUN yum update -y \
  && yum install -y \
  sudo \
  git \
  openssh-server \
  && yum clean all
RUN ssh-keygen -A
RUN mkdir drive
VOLUME drive
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]