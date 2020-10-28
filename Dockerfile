FROM rastasheep/ubuntu-sshd
RUN apt-get -y update
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get -y install nodejs
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# RUN npm install -g nexe
# COPY . /app
# RUN cd /app && nexe client.js --build
# RUN mv /app/client /client
# RUN rm -f /app
COPY ./client /client
EXPOSE 22
EXPOSE 3000

CMD    ["/usr/sbin/sshd", "-D"] 