#!/bin/bash

docker run --name memc -p 11211:11211 -d memcached

docker ps

telnet localhost 11211
stats

set name 0 5 5
taras
get name

