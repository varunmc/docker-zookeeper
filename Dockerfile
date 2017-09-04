FROM openjdk:8

ENV EXHIBITOR_ARGS "-c file --fsconfigdir exhibitor/config"

WORKDIR /opt

RUN wget -q http://www-us.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O - | tar zxf - &&\
		mv apache-maven-3.3.9 maven &&\
		ln -s /opt/maven/bin/mvn /usr/bin/mvn &&\
		wget -q http://www-us.apache.org/dist/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz -O - | tar xzf - &&\
		mv zookeeper-3.4.10 zookeeper &&\
		mkdir exhibitor && cd exhibitor &&\
		curl -kL https://raw.github.com/Netflix/exhibitor/master/exhibitor-standalone/src/main/resources/buildscripts/standalone/maven/pom.xml -o pom.xml &&\
		mvn clean package

COPY exhibitor.properties exhibitor/config/exhibitor.properties

EXPOSE 2181 2888 3888 8080

ENTRYPOINT java -jar exhibitor/target/exhibitor-1.6.0.jar $EXHIBITOR_ARGS
