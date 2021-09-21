#!/bin/bash

for snap in snap0{1..9}; do sudo systemctl stop lwa-feng-etcd@$snap.service; done
for snap in snap0{1..9}; do sudo systemctl start lwa-feng-etcd@$snap.service; done
