#!/bin/bash

FILE=backup/kimai.sql
KIMAI_CONTAINER=kimai
DB_CONTAINER=kimai-db

# get version
docker exec -it ${KIMAI_CONTAINER} /opt/kimai/bin/console kimai:version --env=prod

# backup db
docker exec ${DB_CONTAINER} mysqldump --single-transaction ${DB_DATABASE} > ${FILE}