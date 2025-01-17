ARG BASEIMAGE=node:18-alpine
FROM ${BASEIMAGE}

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL mantainer="Joseph Waweru <josephwawerug@gmail.com>" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="PouchDB" \
    org.label-schema.description="PouchDB, the Database that Syncs!" \
    org.label-schema.url="https://pouchdb.waweru.dev" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/kakashy/PouchDB" \
    org.label-schema.vendor="Joseph Waweru" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

## Install build toolchain, install node deps and compile native add-ons
RUN apk --update --no-cache add curl g++ make python3 && \
    npm install --global --unsafe-perm=true pouchdb-server && \
    rm -rf /root/.[^.]* && \
    apk del g++ make python3

# RUN mkdir /pouchdb

WORKDIR /pouchdb

ENTRYPOINT ["pouchdb-server"]

CMD ["-o", "0.0.0.0"]
