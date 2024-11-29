#!/bin/bash

# 設定參數
REGION="us-east-1"
ECR_URI="545009853444.dkr.ecr.us-east-1.amazonaws.com"
PORT_MAPPING="80:3000"

# 步驟 1: 登錄到 Amazon ECR
echo "Logging into Amazon ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_URI

if [ $? -ne 0 ]; then
  echo "ECR login failed!"
  exit 1
fi

echo "Pulling the latest Docker image..."
docker pull 545009853444.dkr.ecr.us-east-1.amazonaws.com/simple-docker-service-0affe087abbf:latest

if [ $? -ne 0 ]; then
  echo "Failed to pull Docker image!"
  exit 1
fi

echo "Starting new container..."
docker run -d -p 80:3000 --name my-app 545009853444.dkr.ecr.us-east-1.amazonaws.com/simple-docker-service-0affe087abbf:latest
