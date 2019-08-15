#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
    CREATE EXTENSION plpython3u;
    UPDATE pg_language SET lanpltrusted = true WHERE lanname LIKE 'plpython3u';
EOSQL
#Remove lanpltrusted = true in prod!!