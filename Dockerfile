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
RUN mkdir /app
WORKDIR /app
COPY client.js /app/client.js
COPY package.json /app/package.json
RUN npm install
COPY motd /etc/motd
COPY sshd_config /etc/ssh/sshd_config

# EXPOSE 22
# EXPOSE 3000


CMD ["node", "/app/client.js"] 