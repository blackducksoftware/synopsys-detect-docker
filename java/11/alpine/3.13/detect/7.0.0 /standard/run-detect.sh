#!/bin/bash

# This script will be run as the entrypoint for detect containers

DETECT_JAR=synopsys-detect.jar

SOURCE_DIR=/source
OUTPUT_DIR=/output

DISPLAY_HELP=false

# Get Args

ARGS=""

while [[ $# -gt 0 ]]
do
arg="$1"

case $arg in
    -h|--help)
    DISPLAY_HELP=true
    break
    ;;
    --build.command)
    BUILD_CMD=$2
    shift
    ;;
    *) # append to args
    ARGS="${ARGS} ${arg}"
    shift
    ;;
esac
done

# If build command was passed, run on source
if [[ ! -z ${BUILD_CMD} ]]; then
    OLD_PWD=${PWD}
    cd ${SOURCE_DIR}
    echo "Running ${BUILD_CMD}"
    eval ${BUILD_CMD}
    cd ${OLD_PWD}
fi

if [[ ${DISPLAY_HELP} == "true" ]]
then
    CMD="java -jar /${DETECT_JAR} -hv"
else
    CMD="java -jar /${DETECT_JAR} --detect.source.path=${SOURCE_DIR} --detect.output.path=${OUTPUT_DIR} --detect.phone.home.passthrough.invoked.by.image=true ${ARGS}"
fi

echo "Running ${CMD}"
eval ${CMD}
RESULT=$?
echo "Result code of ${RESULT}, exiting."
exit ${RESULT}
