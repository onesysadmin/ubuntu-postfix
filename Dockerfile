FROM ubuntu:trusty
MAINTAINER Alex Sanz <asans@evirtualpost.com>

ENTRYPOINT ["/app/init-postfix.sh"]
EXPOSE 25

# Build packages first
COPY deploy/ /app/
RUN /app/install.sh
