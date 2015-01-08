#!/bin/bash
chown -R nobody:users /root/.flexget
exec /sbin/setuser nobody flexget daemon start
