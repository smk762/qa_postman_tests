#!/bin/bash
docker compose stop
docker compose up -d
docker compose logs newman -f -n 1
