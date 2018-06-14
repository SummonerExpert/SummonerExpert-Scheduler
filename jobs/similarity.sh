#!/bin/bash

docker exec -t app rake ml:similarity:pre
docker exec -t ml python /app/scripts/similarity/similarity.py
docker exec -t app rake ml:similarity:post
