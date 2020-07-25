# Hacker Laws Action

An action to add random hacker law as a comment to the pull request.

## Usage

```yaml
name: Hacker Laws Action

on: 
  pull_request:
    types: [opened]

jobs:
  hacker_laws_action:
    runs-on: ubuntu-latest
    name: Hacker Laws Action Job
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Hacker Laws Action Step
        env:
          PR_URL: ${{ github.event.pull_request.comments_url }}
          PR_SENDER: ${{ github.actor }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        uses: umutphp/hacker-laws-action@v1
        id: hacker_laws_action
```

## Contributing

Please feel free to contribute to the action.

