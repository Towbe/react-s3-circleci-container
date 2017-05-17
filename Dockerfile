FROM kkarczmarczyk/node-yarn:7.6

ENV S3_TMP /tmp/s3cmd.zip
ENV S3_ZIP /tmp/s3cmd-master
ENV RDS_TMP /tmp/RDSCLi.zip
ENV RDS_VERSION 1.19.004
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV AWS_RDS_HOME /usr/local/RDSCli-${RDS_VERSION}
ENV PATH ${PATH}:${AWS_RDS_HOME}/bin:${JAVA_HOME}/bin:${AWS_RDS_HOME}/bin
ENV PAGER more

WORKDIR /tmp

RUN apt-get update && apt-get install -y \
  python \
  python-pip \
  python-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install awscli
