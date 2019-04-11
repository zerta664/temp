#!/bin/bash

cd  /var/www/je

GIT_SSH_COMMAND='ssh -i /root/id_rsa -o "StrictHostKeyChecking no"' git  pull origin master

