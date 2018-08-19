#!/bin/bash

curl -X POST -d '{"state": "OFF"}' http://127.0.0.1:8123/api/states/$1
