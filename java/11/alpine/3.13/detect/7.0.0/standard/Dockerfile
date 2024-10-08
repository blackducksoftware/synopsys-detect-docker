FROM alpine:3.13

# Update, get bash
RUN apk update && apk add bash && apk add curl

# Java
RUN apk --no-cache add openjdk11-jre

ENV BDS_JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# Download Detect jar

ARG DETECT_SOURCE=https://repo.blackduck.com/bds-integrations-release/com/synopsys/integration/synopsys-detect/7.0.0/synopsys-detect-7.0.0.jar

RUN curl --silent -w "%{http_code}" -L -o /synopsys-detect.jar --create-dirs ${DETECT_SOURCE} \
    && if [[ ! -f /synopsys-detect.jar ]]; then echo "Unable to download Detect 7.0.0 jar" && exit -1 ; fi

# Define Docker Image entrypoint
ENTRYPOINT ["java", "-jar", "/synopsys-detect.jar", "--detect.source.path=/source", "--detect.output.path=/output", "--detect.phone.home.passthrough.invoked.by.image=true"]