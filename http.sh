#!/bin/bash +x

LC_CTYPE=C
URL="http:/www.google.com"

# store the whole response with the status at the and
HTTP_RESPONSE=$(curl --silent --write-out "HTTPSTATUS:%{http_code}" $URL)

# extract the body
HTTP_BODY=$(echo $HTTP_RESPONSE | sed -E 's/HTTPSTATUS\:[0-9]{3}$//')

# extract the status
HTTP_STATUS=$(echo $HTTP_RESPONSE | tr -d '\n' | sed -E 's/.*HTTPSTATUS:([0-9]{3})$/\1/')


# print the body
echo "$HTTP_BODY"

echo "[HTTP status: $HTTP_STATUS]"
