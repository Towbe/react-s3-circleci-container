FROM node:10.8.0

ENV S3_TMP /tmp/s3cmd.zip
ENV S3_ZIP /tmp/s3cmd-master
ENV RDS_TMP /tmp/RDSCLi.zip
ENV RDS_VERSION 1.19.004
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV AWS_RDS_HOME /usr/local/RDSCli-${RDS_VERSION}
ENV PATH ${PATH}:${AWS_RDS_HOME}/bin:${JAVA_HOME}/bin:${AWS_RDS_HOME}/bin
ENV PAGER more

WORKDIR /tmp

#============================================
# Google Chrome to run the e2e tests
#============================================
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable=68.0.3440.84-1 && \
  rm -rf /var/lib/apt/lists/*

#============================================
# Netcat to wait on the server to go online
# for the e2e tests
#============================================
RUN apt-get update && apt-get install -V -y \
  netcat=1.10-41 \
  && rm -rf /var/lib/apt/lists/*

#============================================
# Python and Netcat for aws pushes
#============================================
RUN apt-get update && apt-get install -V -y \
  python \
  python-pip=1.5.6-5 \
  python-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install awscli
