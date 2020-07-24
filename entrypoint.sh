#!/bin/sh -l

hacker-laws-cli random > /law.txt

curl -X POST $PR_URL -H "Content-Type: application/json" \
            -H "Authorization: token $GITHUB_TOKEN" \
            --data-binary "@/law.txt"
