FROM centos
RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && yum -y install java-1.8.0-openjdk-headless tar \
  && curl -s https://www-eu.apache.org/dist/kafka/2.1.1/kafka_2.12-2.1.1.tgz | tar -xz --strip-components=1 \
  && yum clean all
RUN chmod -R a=u /opt/kafka
RUN echo "delete.topic.enable = true" >> /opt/kafka/config/server.properties
WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
