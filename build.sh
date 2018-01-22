#!/bin/bash

TAG=dynamodump:latest
docker pull amazonlinux:latest
docker build -t ${TAG}  --no-cache .
