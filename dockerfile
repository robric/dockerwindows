FROM installer:032019
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]