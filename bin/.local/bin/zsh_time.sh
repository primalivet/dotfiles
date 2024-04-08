#!/usr/bin/env zsh
for i in {1..5}; do
  { time zsh -i -c exit; } 2>&1;
done | awk '/total/{sum+=$11; count++} END{if(count > 0) print sum/count; else print "No data"}'
