#!/bin/bash -xe

sudo snap install docker
sleep 10
sudo docker pull adongy/hostname-docker:latest
sudo docker run -d -p 80:3000 adongy/hostname-docker:latest