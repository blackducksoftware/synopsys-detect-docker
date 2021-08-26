# synopsys-detect-docker

The source of Dockerfiles for supported Synopsys Detect Docker [images](https://hub.docker.com/r/blackducksoftware/detect/tags?page=1&ordering=last_updated).

Dockerfiles are organized by java, alpine (operating system), and Detect version.  For each combination, there is a supported standard and buildless image.  Buildless images automatically disable package manager tools that are meant to be run post-build by passing --detect.detector.buildless=true upon invocation of Detect.
