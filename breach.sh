cat cust.txt |assetfinder -subs-only | filter-resolved -c 100 | while read resolved; do host -t A "$resolved" | awk '{print $NF}' | grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'; done |sort -u |while read ip; do greynoise quick $ip ; done |grep -v "NOT" |cut -d ' ' -f1 |greynoise ip |sed -e '/malicious/,/rDNS/!d'
