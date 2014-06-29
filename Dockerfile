FROM phusion/baseimage

ENV HOME /root

RUN apt-get update
RUN apt-get install -y curl openssl ca-certificates
RUN curl -OL https://mms.mongodb.com/download/agent/backup/mongodb-mms-backup-agent_2.1.0.106-1_amd64.deb
RUN dpkg -i mongodb-mms-backup-agent_2.1.0.106-1_amd64.deb

RUN mkdir /etc/service/mms
ADD script.sh /etc/service/mms/run

CMD ["/sbin/my_init"]
