# nifi
The docker compoe file creates a stack comprising:
- NiFi
- Kafka & Zookeeper
- MiNiFi

The NiFi processors can point to the kafka broker:
```
kafka:9092
```

After the configuration described below, the MiNiFi agent tails the file /tmp/tail.txt and sends the text lines to the NiFi input port

## Preparation
Download `minifi-0.5.0-bin.tar.gz` in docker/minifi

## Start the Docker env
```
docker swarm init
docker stack deploy -c docker-compose.yml nifi
```

## Set up the connection from the minifi agent to the NiFi server
In the NiFi web UI `http://localhost:8080/nifi`, do the following:
* Create an input port, connect it to a processor (e.g. PutFile) or to a Funnel and start it
* Double-click on it and take the port id, for example `58b84b09-0169-1000-b2a5-f0c4730422c1`
* Open a shell the minifi container (`docker container exec -it -u minifi <CONTAINER_ID> /bin/sh`), and run the following
```
cd /opt/minifi
./setup_port.sh <PORT_ID>
/opt/minifi/minifi-0.5.0/bin/minifi.sh restart
```
* In the minifi shell, run a command like the following
```
echo aaa >> /tmp/tail.txt
```
* In the NiFi web UI, check that a new flowfile is present
