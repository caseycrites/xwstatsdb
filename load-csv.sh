#!/bin/sh

psql postgres:///${POSTGRES_DB}?host=/var/run/postgresql -c "\copy stats (solved,puzzle_date,time_taken,completed_at,checks,reveals,constructor) from '/docker-entrypoint-initdb.d/xwstats.csv' WITH CSV"
