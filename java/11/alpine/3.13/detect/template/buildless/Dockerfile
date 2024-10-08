FROM alpine:3.18

# Update, get bash
RUN apk update && apk add bash && apk add curl

# Java
RUN apk --no-cache add openjdk11-jre

ENV BDS_JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# Download Detect jar

ARG DETECT_SOURCE=<detectsource>

RUN if [ $(curl --silent -L -w '%{http_code}' -o /detect.jar --create-dirs ${DETECT_SOURCE}) != "200" ]; then echo "Unable to download Detect jar from ${DETECT_SOURCE}"; exit 1; fi

# Define Docker Image entrypoint
ENTRYPOINT ["java", "-jar", "/detect.jar", "--detect.source.path=/source", "--detect.output.path=/output", "--detect.phone.home.passthrough.invoked.by.image=true", "--detect.accuracy.required=NONE"]
