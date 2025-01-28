FROM ubuntu:24.04
LABEL version="1.0"
LABEL description="Feldera, Redpanda, PSQL CLI bundle"

WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.local/bin:/root/.cargo/bin:$PATH"
ENV FELDERA_HOST=http://pipeline-manager:8080

RUN apt-get update && apt-get install -y vim curl unzip pkg-config libssl-dev gcc make postgresql-client && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -LO https://github.com/redpanda-data/redpanda/releases/latest/download/rpk-linux-amd64.zip && mkdir -p /root/.local/bin && unzip rpk-linux-amd64.zip -d /root/.local/bin/ && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && /root/.cargo/bin/cargo install fda --version 0.35.0 && rm -rf rpk-linux-amd64.zip
