# FROM ubuntu

# RUN apt-get update && \
#  apt-get install -y openssh-server

# RUN useradd remote_user && \
#     echo "remote_user:1234" | chpasswd && \
#     mkdir /home/remote_user / .ssh -p && \
#     chmod 700 /home/remote_user/.ssh && \
#     mkdir -p -m755/var/run/sshd

# COPY remote_key.pub /home/remote_user/.ssh/authorized_key

# RUN chown remote_user:remote_user -R /home/remote_user && \
#     chmod 400 /home/remote_user/.ssh/authorized_key

# RUN service ssh start
# CMD ["/usr/sbin/sshd", "-D"]


FROM ubuntu

RUN apt-get update && \
    apt-get install -y openssh-server

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir -p /home/remote_user/.ssh -m 700 && \
    mkdir -p /var/run/sshd -m 755

COPY remote_key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user && \
    chmod 400 /home/remote_user/.ssh/authorized_keys

CMD service ssh start && tail -f /dev/null
