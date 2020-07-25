#!/bin/sh -l

/hacker-laws-cli random > /law.txt

sed 's/\"/\\\"/g' /law.txt > /law_escaped.txt

echo '{ "body": "This comment is a small gift to you for opening the PR. Here is a random law from Hacker Laws repo.' > /law_json.txt
cat /law_escaped.txt >> /law_json.txt
echo '" }' >> /law_json.txt

sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g' /law_json.txt > /law_single_line.txt

sed 's/github.com\/dwmkerr\/hacker-laws/https:\/\/github.com\/dwmkerr\/hacker-laws/g' /law_single_line.txt > /law_final.txt

curl -X POST $PR_URL -H "Content-Type: application/octet-stream" \
    -H "Authorization: token $GITHUB_TOKEN" \
    --data-binary "@/law_final.txt"
