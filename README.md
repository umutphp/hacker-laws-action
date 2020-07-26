# Hacker Laws Action

An action to an add random hacker law (from [dwmkerr/hacker-laws](https://github.com/dwmkerr/hacker-laws) ) as a comment to the pull request.

A sample execution can be seen on this [PR](https://github.com/umutphp/hacker-laws-action/pull/1).

## Usage

Use the following YAML to create the action file under the `.github/workflows` directory.

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
