---
title: Logstash Filter Verifier
date: 2026-07-25
tags: [observability]
---
Logstash Filter Verifier (LFV) is tool to run tests for Logstash
filters.

As of writing, the latest stable release is
[v1.6.3](https://github.com/magnusbaeck/logstash-filter-verifier/releases/tag/1.6.3),
and the latest beta version is
[v2.0.0-beta.3](https://github.com/magnusbaeck/logstash-filter-verifier/releases/tag/v2.0.0-beta.3).

My recommendation is to use the stable release unless you need to test
pipeline to pipeline configs, which are only supported from v2.

## Examples

I've written an example of the single pipeline and multi pipeline
scenarios:

* <https://github.com/aadam-ali/examples/tree/550a3eceb720ee364bfcee9aa3c222ff3794cc19/logstash-filter-verifier>

## Considerations (tested against the stable release)

* LFV does not respect the `logstash.yml` file ([source
  code](https://github.com/magnusbaeck/logstash-filter-verifier/blob/c2731552cd5c8fa9f5de73638de9818aabde307b/logstash/invocation.go#L107))
  instead any config options must be set using the `--logstash-arg` flag
  e.g. `--logstash-arg=--pipeline.ecs_compatibility --logstash-arg
  disabled`
* LFV clears all environment variables, to forward environment variables
  use the `--keep-env` flag e.g. `--keep-env PATH`
* LFV doesn't work with some codecs e.g. `cloudwatch_logs`, however
  using `json_lines` or `line` as a replacement is sufficient if you know
  the shape of the logs that Logstash will be ingesting
* LFV v1 doesn't support pipeline to pipeline communication, using v2
  solves this
* LFV requires you to make assertions against all outputs for an event,
  in the order in which they were emitted

Related:
* [2026-07-25 Validate Logstash Configuration](2026-07-25%20Validate%20Logstash%20Configuration.md)
* <https://github.com/magnusbaeck/logstash-filter-verifier>
* <https://www.elastic.co/docs/reference/logstash/pipeline-to-pipeline#distributor-pattern>
