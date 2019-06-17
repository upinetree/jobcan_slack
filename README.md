# A ruby client for JobCan Slack

## Requirement

- Ruby 2.7.0.preview1

## Installation

```console
$ gem build jobcan_slack.gemspec
$ gem install jobcan_slack-${VERSION}.gem
```

## Usage

1. Register JobCan slack app on your slack account
2. Generate slack legacy token
3. Run `jobcan_touch` command


```console
$ export SLACK_API_TOKEN={legacy slack token} 
$ export JOBCAN_SLACK_CHANNEL=${your public channel name}
$ jobcan_touch
```
