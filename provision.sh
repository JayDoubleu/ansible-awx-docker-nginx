#!/bin/bash
docker build -t awx_nginx .
docker-compose up -d
