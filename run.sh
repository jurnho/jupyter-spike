#!/usr/bin/env bash

docker build . --tag jupyter-spike:latest

docker container run --rm -it -v $(PWD)/notebook:/home/jupyter/notebook -p 8888:8888  --name jupyter-spike jupyter-spike:latest
