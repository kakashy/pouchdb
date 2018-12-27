FROM node:alpine
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL mantainer="Eloy Lopez <elswork@gmail.com>" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="PouchDB" \
    org.label-schema.description="PouchDB, the Database that Syncs!" \
    org.label-schema.url="https://deft.work" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/DeftWork/PouchDB" \
    org.label-schema.vendor="Deft Work" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

## Install build toolchain, install node deps and compile native add-ons
RUN apk add --no-cache --virtual .gyp python make g++
RUN npm install -g --unsafe-perm=true pouchdb-server pouchdb-adapter-leveldb && \
rm -rf /root/.[^.]* && \
apk del g++ make python

RUN mkdir /pouchdb

WORKDIR /pouchdb

CMD ["pouchdb-server", "-p", "5984", "-o", "0.0.0.0"]