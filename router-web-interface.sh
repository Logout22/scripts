#!/bin/bash
ssh -N -L 8082:localhost:80 root@skaro.lan &
while ! curl -s -o /dev/null localhost:8082; do sleep 1; done
firefox http://localhost:8082/
read -r
