#FROM openjdk:16-jdk
FROM ubuntu:20.04

# Init ENV
ENV PENTAHO_HOME /opt/pentaho

RUN apt update; apt --yes install default-jdk; apt install -y iputils-ping

#Apply JAVA_HOME (Verificar última versao java-(versao)-openjdk-amd64) 
RUN . /etc/environment
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN mkdir ${PENTAHO_HOME}; useradd -s /bin/bash -d ${PENTAHO_HOME} pentaho; chown pentaho:pentaho ${PENTAHO_HOME}

RUN apt update; apt add zip netcat -y; \
    apt install wget unzip git vim -y; \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

######Utilizar se não já estiver baixado o pentaho######
# Download do pentaho server em https://megalink.dl.sourceforge.net/project/pentaho/Pentaho%209.1/server/pentaho-server-ce-9.1.0.0-324.zip?viasf=1
RUN wget --progress=dot:giga https://megalink.dl.sourceforge.net/project/pentaho/Pentaho%209.1/server/pentaho-server-ce-9.1.0.0-324.zip?viasf=1 -O /tmp/pentaho-server.zip 
#ADD pentaho-server-ce-9.1.0.0-324.zip /tmp/pentaho-server.zip 

# Decompactar o pentaho-server; iniciar o tomcat; atribuir permissões
RUN /usr/bin/unzip -q /tmp/pentaho-server.zip -d  $PENTAHO_HOME; \
    rm -f /tmp/pentaho-server.zip $PENTAHO_HOME/pentaho-server/promptuser.sh; \
    sed -i -e 's/\(exec ".*"\) start/\1 run/' $PENTAHO_HOME/pentaho-server/tomcat/bin/startup.sh; \
    chmod +x $PENTAHO_HOME/pentaho-server/start-pentaho.sh


######Utilizar se já estiver baixado o pentaho######
#COPY ./pentaho-server ${PENTAHO_HOME}

##Para o pentaho aguardar subir o postgres
# Add docker-compose-wait tool -------------------
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait



