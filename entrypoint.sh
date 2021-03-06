#!/bin/sh -l

/hacker-laws-cli random > /law.txt

sed 's/\"/\\\"/g' /law.txt > /law_escaped.txt

echo $PR_SENDER

PREPEND_STR="@"
SENDER="$PREPEND_STR$PR_SENDER"

echo $SENDER

echo '{ "body": "Hi ' "$SENDER, \n\n" 'A random law from [Hacker Laws repository](https://github.com/dwmkerr/hacker-laws) is a small gift to thank you for opening the PR.' > /law_json.txt
cat /law_escaped.txt >> /law_json.txt
echo '" }' >> /law_json.txt

sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g' /law_json.txt > /law_final.txt

curl -X POST $PR_URL -H "Content-Type: application/octet-stream" \
    -H "Authorization: token $GITHUB_TOKEN" \
    --data-binary "@/law_final.txt"
