FROM postgres:14

ENV POSTGRES_HOST_AUTH_METHOD=trust
ENV POSTGRES_DB=xwstatsdb

COPY schema.sql /docker-entrypoint-initdb.d/0.sql
COPY load-csv.sh /docker-entrypoint-initdb.d/1.sh
RUN chmod +x /docker-entrypoint-initdb.d/1.sh
COPY xwstats-processed.csv /docker-entrypoint-initdb.d/xwstats.csv
