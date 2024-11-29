#!/bin/bash
docker stop my-app || true
docker rm my-app || true
docker run -d -p 80:3000 --name my-app 545009853444.dkr.ecr.us-east-1.amazonaws.com/simple-docker-service-0affe087abbf:latest
