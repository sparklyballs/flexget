#!/bin/bash
chown -R nobody:users /root/.flexget
exec /sbin/setuser nobody flexget -c /config/config.yml daemon start
