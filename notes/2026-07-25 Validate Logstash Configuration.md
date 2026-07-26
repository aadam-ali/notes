---
title: Validate Logstash Configuration
date: 2026-07-25
tags: [observability]
---
To test the validity of Logstash config syntax, add the
`--config.test_and_exit` to the command and flags you usually use to
start Logstash e.g. `logstash --config.test_and_exit`.

This starts Logstash, parses the config files, then exits, returning a
non-zero exit code if any errors are found.

## Considerations

* When using environment variables without defaults in the config e.g.
  `${PORT}` vs `${PORT:8080}`, you must ensure that the values are set
  before running the command (as you would during deployment)
* Plugins may validate the values of the config options passed into
  them, you must pass in values that satisfy the validation criteria if
  not using the actual deployed values (likely the case for local
  development or in CI)
* If `pipelines.yml` is pointing to the wrong directory, one that
  doesn't contain `*.conf` files, Logstash won't return a non-zero exit
  code but it will log a message like `No config files found in path
  {path: "<path>/*"}`

Related:
* [2026-07-25 Logstash Filter Verifier](2026-07-25%20Logstash%20Filter%20Verifier.md)
* <https://www.elastic.co/docs/reference/logstash/running-logstash-command-line>
