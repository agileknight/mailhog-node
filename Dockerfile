FROM alpine:3.12

RUN apk --no-cache add \
  nodejs \
  npm \
  && npm install -g \
  npm@latest \
  mocha@8 \
  # Clean up obsolete files:
  && rm -rf \
  /tmp/* \
  /root/.npm

USER nobody

WORKDIR /opt

COPY wait-for-hosts.sh /usr/local/bin/wait-for-hosts

ENTRYPOINT ["wait-for-hosts", "--", "mocha"]
