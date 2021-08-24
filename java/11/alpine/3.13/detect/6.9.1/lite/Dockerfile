FROM alpine:3.13

# Update, get bash
RUN apk update && apk add bash && apk add curl

# Java
ARG JAVA_VERSION
RUN apk --no-cache add openjdk11-jre

ENV BDS_JAVA_HOME=/usr/lib/jvm/java-11-openjdk

# Copy in entrypoint script
ARG RUN_DETECT_SCRIPT="run-detect.sh"

COPY ./${RUN_DETECT_SCRIPT} /

# Download Detect jar

ARG DETECT_BINARY_REPO_URL=https://sig-repo.synopsys.com
ARG DETECT_SOURCE=${DETECT_BINARY_REPO_URL}/bds-integrations-release/com/synopsys/integration/synopsys-detect/6.9.1/synopsys-detect-6.9.1.jar

RUN JAR_PATH=/synopsys-detect.jar \
    && curl --silent -w "%{http_code}" -L -o ${JAR_PATH} --create-dirs ${DETECT_SOURCE} \
    && if [[ ! -f ${JAR_PATH} ]]; then echo "Unable to download Detect 6.9.1 jar" && exit -1 ; fi

# Define Docker Image entrypoint
ENTRYPOINT ["bash", "/run-detect.sh", "--detect.tools.excluded=DETECTOR"]