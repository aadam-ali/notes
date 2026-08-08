FROM node:26.6.0-trixie-slim@sha256:80f12a4030a00d8f78ebc4602bc3ef0f984932f498649b8ed3c0a740a6dff4a8 AS builder

RUN apt-get update -y && apt-get upgrade -y  && apt-get install --no-install-recommends -y ca-certificates=20250419 git=1:2.47.3-0+deb13u1 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /
# Clone v4 branch of github.com/jackyzha0/quartz
RUN git clone https://github.com/jackyzha0/quartz.git /quartz && git -C /quartz checkout 59b58076016c5e5f09f16ab0395fed02e2ebb72e

WORKDIR /quartz

RUN npm install

COPY quartz/quartz.config.ts quartz.config.ts
COPY quartz/quartz.layout.ts quartz.layout.ts
COPY notes /quartz/content

RUN npx quartz build

ENTRYPOINT [ "npx", "quartz", "build", "--serve" ]
CMD [ "--port", "8080" ]

# Used to export built site to ./public
FROM scratch AS export

COPY --from=builder /quartz/public /public
