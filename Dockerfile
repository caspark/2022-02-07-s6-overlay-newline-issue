FROM alpine:3

ENV S6OVERLAY_VERSION=3.0.0.2
RUN apk update \
 && apk add curl \
 && cd /tmp/ \
 && curl -fsSLO "https://github.com/just-containers/s6-overlay/releases/download/v${S6OVERLAY_VERSION}/s6-overlay-noarch-${S6OVERLAY_VERSION}.tar.xz" \
 && tar -C / -Jxpf "/tmp/s6-overlay-noarch-${S6OVERLAY_VERSION}.tar.xz" \
 && rm "/tmp/s6-overlay-noarch-${S6OVERLAY_VERSION}.tar.xz" \
 && curl -fsSLO "https://github.com/just-containers/s6-overlay/releases/download/v${S6OVERLAY_VERSION}/s6-overlay-x86_64-${S6OVERLAY_VERSION}.tar.xz" \
 && tar -C / -Jxpf "/tmp/s6-overlay-x86_64-${S6OVERLAY_VERSION}.tar.xz" \
 && rm "/tmp/s6-overlay-x86_64-${S6OVERLAY_VERSION}.tar.xz"
ENTRYPOINT [ "/init" ]

COPY ./s6-overlay/ /etc/s6-overlay/

CMD ["/command/with-contenv", "sh", "-c", "sleep 1 && echo 'Printing out env from CMD...' && env"]
