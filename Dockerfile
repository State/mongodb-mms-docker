FROM fedora:21

RUN yum update -y -q; yum clean all
RUN yum install -y -q \
  hostname \
  https://mms.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent-2.9.0.164-1.x86_64.rhel7.rpm \
  https://mms.mongodb.com/download/agent/backup/mongodb-mms-backup-agent-3.0.0.246-1.x86_64.rhel7.rpm

ADD run.sh /run.sh

CMD /run.sh
