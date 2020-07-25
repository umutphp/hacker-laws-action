FROM ubuntu

RUN  apt-get update \
  && apt-get install -y wget curl \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY ./scripts/build.sh /build.sh

RUN chmod +x /build.sh
RUN chmod +x /entrypoint.sh

RUN /build.sh

ENTRYPOINT ["/entrypoint.sh"]
