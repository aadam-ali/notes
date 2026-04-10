---
title: Invalidating Docker build cache
date: 2026-04-10
---
The Docker build cache can be invaildated using cache busting, in the
following example an `ARG` is used but the `--no-cache` can also be
used.

Using the following Dockerfile:

```dockerfile
FROM alpine

ARG CACHE_EXPIRY

RUN sleep 10
```

We can see that building an image for the first time results in a cache
miss and the sleep command running.

```sh
$ docker build --build-arg CACHE_EXPIRY=1 --cache-from=demo -t demo .
[+] Building 13.7s (7/7) FINISHED                                docker:default
...
 => ERROR importing cache manifest from demo                               0.6s
...
 => [2/2] RUN sleep 10                                                    10.3s
...
```

If we build the image again with the same options, the cache hits and the sleep
command doesn't run because the layer is cached.

```sh
$ docker build --build-arg CACHE_EXPIRY=1 --cache-from=demo -t demo .
[+] Building 0.7s (7/7) FINISHED                                 docker:default
...
 => importing cache manifest from demo
...
 => CACHED [2/2] RUN sleep 10                                              0.0s
...
```

If we change the value of the `CACHE_EXPIRY`, we see that the cache
hits. However, because the value of `CACHE_EXPIRY` has changed, the
layer is no longer cached and the sleep command runs.

```sh
$ docker build --build-arg CACHE_EXPIRY=2 --cache-from=demo -t demo .
[+] Building 11.4s (7/7) FINISHED                                docker:default
...
 => importing cache manifest from demo                                     0.0s
...
 => [2/2] RUN sleep 10                                                    10.3s
...
```

Hard coding the value isn't very useful but something like `--build-arg
CACHE_EXPIRY=$(date +%U)` forces images to be completely rebuilt weekly.
