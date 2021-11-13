.PHONY: all process build run clean

all: process build run

process:
	./process-stats.sh > ./xwstats-processed.csv

build:
	docker build . -t xwstatsdb

run:
	docker run -p 5432:5432 xwstatsdb

clean:
	rm xwstats-processed.csv
