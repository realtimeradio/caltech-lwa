#!/bin/bash

for snap in snap0{1..9} snap{10..11}; do sudo systemctl stop lwa-feng-etcd@$snap.service; done
