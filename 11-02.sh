#!/bin/bash

docker run --name memc -p 11211:11211 -d memcached

docker ps

telnet localhost 11211
stats

set name 0 5 5
taras
get name

docker run --name reist -d redis
docker ps
docker stop memc

docker exec -it reist redis-cli


set key1 one
set key2 two
set key3 three

get key1 
get key2
get key3
quit

docker exec -it reist redis-cli

set key5 5
incrby key5 5
get key5
quit