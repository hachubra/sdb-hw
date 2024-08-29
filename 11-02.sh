#!/bin/bash

docker run --name memc -p 11211:11211 -d memcached

docker ps

