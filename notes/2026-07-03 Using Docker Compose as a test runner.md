---
title: Using Docker Compose as a test runner
date: 2026-07-03
---
Recently, I've been looking at writing tests to test the configuration
of open source software components to ensure that they behaves as
expected.

In this context, the software runs in Docker. So I decided to test the
it using Docker.

The example below is really basic and not an effective test, but it does
get the point across.

Given a compose file as follows:

```yaml
services:
    test-runner:
        image: alpine@sha256:fd791d74b68913cbb027c6546007b3f0d3bc45125f797758156952bc2d6daf40

        entrypoint: [/bin/ash]
        command:
            - -c
            - false
```

You can run the following command(s):

* `docker compose up` - runs the service(s), logs their exit codes but
  doesn't return one based on any service
* `docker compose up --exit-code-from test-runner` - runs the
  service(s), logs their exit codes, and returns the exit code of the
  target service
* `docker-compose up --exit-code-from test-runner test-runner` - runs
  the selected service, logs its error code, and returns it (useful when
  you have multiple services)

If you want to run multiple services in parallel and still be able to
capture an exit code based on the services, you'll need to write some
code to achieve this.

Related:
* <https://stackoverflow.com/questions/29568352/using-docker-compose-with-ci-how-to-deal-with-exit-codes-and-daemonized-linked>
