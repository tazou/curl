#!/bin/bash
#gduale - 2018-01-26

unset http_proxy

echo "#Create session"
curl --cookie cookies.txt --cookie-jar newcookies.txt -i -s -k  -X $'POST' \
    -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0' -H $'Referer: http://supervision.lan/login.php' -H $'Content-Type: application/x-www-form-urlencoded' -H $'DNT: 1' -H $'Upgrade-Insecure-Requests: 1' \
    --data-binary $'login=nagios&mdp=****' \
    $'http://supervision.lan/login.php'

echo "#Get json"
curl --cookie newcookies.txt "http://supervision.lan/thruk/cgi-bin/status.cgi?view_mode=json&host=all"

rm -f newcookies.txt
