#!/bin/sh

# chop the header off, replace any commas within quotes with 'and', remove quotes, grab just the fields we want, convert all upper case to lower case, add timezone after the timestamp (the 4th comma)
tail -n +2 xwstats.csv | sed -e 's/\("[^,]*\),/\1 and/g' | tr -d '"' | cut -d ',' -f1,2,4,8,9,10,11 | tr '[:upper:]' '[:lower:]' | sed -e 's/,/ America\/New_York,/4'
