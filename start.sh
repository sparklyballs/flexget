#!/bin/bash
chown -R nobody:users /root/.config
exec /sbin/setuser nobody flexget daemon start
