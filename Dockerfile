FROM node:25.9.0-trixie-slim@sha256:76d00a5baec72c6ade09b6254f35ef036087871f883d941bc00b2efbf4ab8a92 AS builder

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

ENTRYPOINT ["npx", "quartz", "build", "--serve", "--port", "8080"]


# Used to export built site to ./public
FROM scratch AS export

COPY --from=builder /quartz/public /public
