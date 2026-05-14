#!/bin/bash

FILE=backup/kimai.sql
KIMAI_CONTAINER=kimai
DB_CONTAINER=kimai-db

# restore db
cat ${FILE} | docker exec -i ${DB_CONTAINER} /usr/bin/mysql ${DB_DATABASE}

# reload cache
docker exec -it ${KIMAI_CONTAINER} /opt/kimai/bin/console kimai:reload --env=prod