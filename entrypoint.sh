#!/bin/sh -l

/usr/bin/entry.sh
chown -R "$(id -u):$(id -g)" .
