# PouchDB

This repository offers a regularly-updated Docker image for PouchDB Server.

## Getting Started

To set the ball rolling:

```sh
docker run -d \
    --name my-pouchdb \
    -p 5984:5984 \
    waweruj/pouchdb
```

```sh
$ docker start my-pouchdb
$ docker stop my-pouchdb
$ docker rm my-pouchdb
```

## Data Persistence
By default, the PouchDB server inside the container uses its internal storage mechanism. Any data written to the PouchDB instance will be stored within the container's local storage. However, it's crucial to be aware that this data is ephemeral and will not be persisted beyond the container's lifecycle.

## Ephemeral Data
Since no mounted file storage or external volumes are used, all data within the PouchDB server will be lost when the container is stopped or removed. This means that if you shut down the container or if it crashes, any data written to the PouchDB server will be gone.

## Data Backup and Restore
To ensure data preservation, it is recommended to implement a backup and restore mechanism outside the container. You can utilize PouchDB's built-in replication features or explore other backup solutions compatible with PouchDB to store data outside the container.

## Important Note
While the next update will offer mounted storage, if you require persistent data storage, consider configuring the PouchDB server to use an external database, such as CouchDB or other compatible databases, that can be mounted as a volume or run separately from the container.

