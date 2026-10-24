FROM node:26.12.0-trixie-slim@sha256:e556a144463cc8dc53afe8de6d2fa0db5c132fd39ffa232c17641bd40df2bf11 AS builder

RUN apt-get update -y && apt-get upgrade -y  && apt-get install --no-install-recommends -y ca-certificates=20250419 git=1:2.47.3-0+deb13u1 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /
# Clone v5 branch of github.com/jackyzha0/quartz
RUN git clone https://github.com/jackyzha0/quartz.git /quartz && git -C /quartz checkout 97a2d05f80c4c50534959b1d0d41cc4b3895625e

WORKDIR /quartz

RUN npm install

COPY quartz/quartz.config.yaml /quartz/quartz.config.yaml
COPY quartz/static/icon.png /quartz/quartz/static/icon.png
COPY notes /quartz/content

RUN npx quartz plugin install --from-config && npx quartz build

ENTRYPOINT [ "npx", "quartz", "build", "--serve" ]
CMD [ "--port", "8080", "--watch" ]

# Used to export built site to ./public
FROM scratch AS export

COPY --from=builder /quartz/public /public
