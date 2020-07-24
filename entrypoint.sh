#!/bin/sh -l

/hacker-laws-cli random > /law.txt

sed 's/\"/\\\"/g' /law.txt > /law_escaped.txt

echo '{ "body": "' > /law_json.txt
cat /law_escaped.txt >> /law_json.txt
echo '" }' >> /law_json.txt

cat /law_json.txt

curl -X POST $PR_URL -H "Content-Type: application/octet-stream" \
            -H "Authorization: token $GITHUB_TOKEN" \
            --data-binary "@/law_json.txt"
