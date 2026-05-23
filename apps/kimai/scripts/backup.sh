#!/bin/bash

FILE=backup/kimai.sql
DB_DATABASE=kimai
CONF=.my.cnf

# backup db
mysqldump --defaults-file=${CONF} --single-transaction ${DB_DATABASE} > ${FILE}
