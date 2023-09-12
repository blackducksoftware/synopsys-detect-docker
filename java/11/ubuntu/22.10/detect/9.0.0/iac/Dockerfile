FROM ubuntu:23.04

# Update
RUN apt-get update

RUN apt-get -y install curl

# Java
RUN apt-get -y install default-jre-headless
ENV BDS_JAVA_HOME=/usr/lib/jvm/default-java

# Configure locale (charset encoding)
RUN apt-get -y install locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Download Detect jar

ARG DETECT_SOURCE=https://sig-repo.synopsys.com/artifactory/bds-integrations-release/com/synopsys/integration/synopsys-detect/9.0.0/synopsys-detect-9.0.0.jar

RUN if [ $(curl --silent -L -w '%{http_code}' -o /synopsys-detect.jar --create-dirs ${DETECT_SOURCE}) != "200" ]; then echo "Unable to download Detect jar from ${DETECT_SOURCE}"; exit 1; fi

# Define Docker Image entrypoint
ENTRYPOINT ["java", "-jar", "/synopsys-detect.jar", "--detect.source.path=/source", "--detect.output.path=/output", "--detect.phone.home.passthrough.invoked.by.image=true"]
