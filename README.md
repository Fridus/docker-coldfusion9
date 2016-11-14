
# Docker CF9


## Features

- [cfapi-json-gateway](https://github.com/LoicMahieu/cfapi-json-gateway)
- Apache modules `rewrite` and `headers` enabled
- Packages `curl php5 php5-gd`


## Get docker image

### Pull

```
docker pull fridus/coldfusion9
```

### Build

```
docker build -t fridus/coldfusion9 .
```


## Create the docker

```
docker run \
  -d \
  -p 8080:80 \
  -v /var/www:/var/www \
  -v /path/vhost:/etc/apache2/sites-enabled \
  -h `hostname` \
  --name cf10 \
  fridus/coldfusion9
```

### With server smtp
With a link smtp, the mail server is automatically configured. The internal name must be `smtp`
```
docker run \
  -d \
  -p 8080:80 \
  -v /var/www:/var/www \
  -v /path/vhost:/etc/apache2/sites-enabled \
  -h `hostname` \
  --link mailcatcher:smtp
  --name cf10 \
  fridus/coldfusion9
```

### With a mysql datasource configured

- `DATASOURCE_NAME`: required
- `DATASOURCE_HOST`: required
- `DATASOURCE_USER`: `root`
- `DATASOURCE_PASSWORD`: `""`
- `DATASOURCE_DB`: `DATASOURCE_NAME` if not defined
- `DATASOURCE_ARGS`: optional

```
docker run \
  -d \
  -p 8080:80 \
  -v /var/www:/var/www \
  -v /path/vhost:/etc/apache2/sites-enabled \
  -h `hostname` \
  --link mailcatcher:smtp
  --name cf10 \
  -e DATASOURCE_NAME=mydatasource \
  -e DATASOURCE_HOST=`ip route get 1 | awk '{print $NF;exit}'` \
  fridus/coldfusion9
```


## Access

- The admin password for the coldfusion server is `Adm1n$`
