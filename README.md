# PouchDB for linux arm & amd64

A [Docker](http://docker.com) image for [PouchDB](https://pouchdb.com/) an open-source JavaScript database inspired by [Apache CouchDB](http://couchdb.apache.org/) that is designed to run well within the browser.
PouchDB was created to help web developers build applications that work as well offline as they do online.
It enables applications to store data locally while offline, then synchronize it with CouchDB and compatible servers when the application is back online, keeping the user's data in sync no matter where they next login. 
This container is compatible with arm & amd64 architectures (thanks to its [Multi-Arch](https://blog.docker.com/2017/11/multi-arch-all-the-things/) base image)

## Details
- [Source Repository](https://github.com/elswork/PouchDB)
- [Deft.Work my personal blog](http://deft.work)

## Getting Started

This is a simple usage for testing proposes.

```sh
$ docker run -d -p 5984:5984 elswork/pouchdb:latest
```

Point your browser to `http://Docker-Host-IP:5984`.

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.
```sh
$ docker run -d \
    --name my-pouchdb \
    -p 5984:5984 \
    elswork/pouchdb:latest
```
`--name my-pouchdb` This is absolutely optional, it helps to me to easily identify and operate the container after the first execution.
```sh
$ docker start my-pouchdb
$ docker stop my-pouchdb
$ docker rm my-pouchdb
...
```
`-p 5984:5984` Caddy will serve https by default.