#!/bin/bash
redis-server /etc/redis/redis.conf
/usr/sbin/apache2ctl -D FOREGROUND
