FROM node:22-alpine

RUN apk add --no-cache git \
 && npm install -g opencode-ai

#COPY . ~/.config/opencode

WORKDIR /workspace

ENTRYPOINT ["opencode"]
CMD []
