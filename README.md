# xwstatsdb

Load CSV download of NYT Crossword stats from [xwstats][xwstats] into a Postgres db for analysis

## Notes

The code here strips out all extra data added by [xwstats][xwstats] so you end up with just the raw data from NYT.

Don't get me wrong, the extra data added by [xwstats][xwstats] is great, but I prefer to look at that on the site and play around with the raw data locally.

## Requirements

- An [xwstats][xwstats] account (consider donating a few dollars to the maintainer for this wonderful service if you can)
- docker

## Usage

### Run

1. Download your stats as a CSV from the Data page and move it to the root of this directory
1. Run `make`

### Access xwsstatsdb

This will build and run a postgres 14 docker container named `xwstatsdb` listening at port 5432 which can be accessed with the following command:

`psql postgres://postgres@localhost:5432/xwstatsdb`

### Try some queries!

Just a couple quick examples (check out the [schema][schema] for the table format)

top 10 longest solve times:

`select * from stats order by time_taken desc limit 10;`

longest average solve times by constructor (10 or more puzzles solved)

`select * from (select constructor, count(*) as puzzles, avg(time_taken) as avg_time from stats group by constructor) as rollup where puzzles >= 10 order by avg_time desc, puzzles desc;`

[xwstats]: https://xwstats.com
[schema]: ./schema.sql
