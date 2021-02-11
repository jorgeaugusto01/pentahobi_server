FROM ubuntu:latest

WORKDIR /app

###################SPOON - PDI###################
# Init ENV
ENV PENTAHO_HOME /opt/pentaho

#RUN apt update; apt --yes install default-jdk; apt install -y iputils-ping

#Instalacão do Java jdk 8 - necessário para executar o spoon (PDI)
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get -y install cron && \
    apt-get clean;

# Copiar o custom cron para o diretório cron
COPY custom-cron /etc/cron.d/custom-cron

# Permissão de execucão no custom-cron
RUN chmod 0644 /etc/cron.d/custom-cron

# Aplicar o cron job custom
RUN crontab /etc/cron.d/custom-cron

#Configurar o JAVA_HOME (Verificar última versao java-(versao)-openjdk-amd64) 
RUN . /etc/environment
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN mkdir ${PENTAHO_HOME}; useradd -s /bin/bash -d ${PENTAHO_HOME} pentaho; chown pentaho:pentaho ${PENTAHO_HOME}

RUN apt update; apt add zip netcat -y; \
    apt install wget unzip git vim -y; \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

######Utilizar se não já estiver baixado o pentaho######
# Download do pentaho server em https://megalink.dl.sourceforge.net/project/pentaho/Pentaho%209.1/server/pentaho-server-ce-9.1.0.0-324.zip?viasf=1
RUN wget --progress=dot:giga https://sourceforge.net/projects/pentaho/files/Pentaho%209.1/client-tools/pdi-ce-9.1.0.0-324.zip/download -O /tmp/pentaho-pdi.zip 

# Decompactar o pentaho pdi na PENTAHO_HOME
RUN /usr/bin/unzip -q /tmp/pentaho-pdi.zip -d  $PENTAHO_HOME;
    #rm -f /tmp/pentaho-pdi.zip $PENTAHO_HOME/pentaho-pdi/promptuser.sh; \
    #chmod +x $PENTAHO_HOME/pentaho-server/start-pentaho.sh

#Aguardar descompactar o arquivo antes de copiar o driver oracl
RUN sleep 30;

# Driver banco oracle - necessário para o pentaho acessar a base do HADES
COPY ./ojdbc6.jar $PENTAHO_HOME/data-integration/lib/