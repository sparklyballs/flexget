#!/bin/bash
exec /sbin/setuser nobody flexget -c /config/config.yml daemon start
