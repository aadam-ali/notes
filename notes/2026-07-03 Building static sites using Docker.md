---
title: Building static sites using Docker
date: 2026-07-03
tags: [docker]
---
Most static site generators (SSG) provide a live development server for
local development and a separate build command to generate a publishable
artifact.

You can easily use Docker for both of these steps, avoiding having to
install the SSG on your host system.

Take the following Dockerfile and compose file (for Hugo):

```dockerfile
FROM ghcr.io/gohugoio/hugo:v0.163.3 AS builder

WORKDIR /hugo

COPY . .

RUN hugo minify

ENTRYPOINT ["hugo", "serve"]
CMD ["--buildDrafts", "--watch", "--port", "8080", "--baseURL", "http://localhost", "--bind", "0.0.0.0", "--noHTTPCache"]

FROM scratch AS export

COPY --from=builder /hugo/public /public
```

```yaml
services:
  hugo:
    image: hugo
    build:
      dockerfile: Dockerfile
      context: .
      target: builder
    volumes:
      - ./:/hugo
    ports:
      - 4321:8080
```

The `builder` stage in the Dockerfile is targeted in the compose file,
allowing you to run the live development server.

The `export` stage copies the content built in the `builder` stage into
an empty `scratch` container. Running `docker build --output . .` copies
the content of the `scratch` build container to the host allowing it to
be published wherever.

Related:
* <https://docs.docker.com/build/building/export/>
* <https://github.com/aadam-ali/blog/commit/3cdc46e91d2abf8b893bb4acf53d001f2804fc9c>
* <https://github.com/aadam-ali/notes/commit/fded96ed883fbc70425437fa7f832adc660f4205>
