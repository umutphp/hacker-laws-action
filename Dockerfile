FROM alpine

RUN apk add --no-cache curl

COPY entrypoint.sh /entrypoint.sh
COPY ./scripts/build.sh /build.sh

RUN chmod +x /build.sh
RUN chmod +x /entrypoint.sh

RUN /build.sh

ENTRYPOINT ["/entrypoint.sh"]
