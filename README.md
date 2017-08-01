# superintendent.hcpss.org

## How to use this repository

### Prerequisites

You'll need [docker](https://www.docker.com/get-docker) and
[docker compose](https://docs.docker.com/compose/install/).

### Get a copy of the production database

Get a mysqldump of the production database and put it in a file called
*data/seed.sql*.

### Get a copy of the uploaded files

Get the uploaded files from the production site. They are in a directory called
*web_root/wp-content/uploads*. Place them in *data/uploads*.

### Bring up the site

Run:

```
$ docker-compose up -d
```

### Visit the site

Visit [http://localhost:8087](http://localhost:8087).
