#!/bin/bash
host="scanme.nmap.org"
ports=("22" "80" "443")  

echo "host,port,banner" > banners.csv
for p in "${ports[@]}"; do
  banner=$(python3 lab4-2_banner.py "$host" "$p" | tr '\n' ' ' | sed 's/"/""/g')
  echo "\"$host\",$p,\"$banner\"" >> banners.csv
done
