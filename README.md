# detect-docker

The source of Dockerfiles for supported Black Duck Detect Docker [images](https://hub.docker.com/r/blackducksoftware/detect/tags?page=1&ordering=last_updated).

Dockerfiles are organized by java, alpine (operating system), and Detect version.  For each combination, there is a supported standard, buildless, and (starting in Detect 7.14.0) iac image.  Buildless images automatically configure Detect to be as resilient as possible by setting --detect.accuracy.required=NONE.  IaC images use a base OS that is compatible with the scanner that Detect employs for IaC scans.
