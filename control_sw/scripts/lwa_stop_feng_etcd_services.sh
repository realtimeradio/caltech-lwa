#!/bin/bash

for snap in snap0{1..9} snap{10..11}; do systemctl --user stop lwa-feng-etcd@$snap.service; done
