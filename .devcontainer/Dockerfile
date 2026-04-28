FROM mcr.microsoft.com/devcontainers/go:1.26

# MariaDB クライアント（mysqldump も含まれる）
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# 開発系ツール
RUN go install github.com/air-verse/air@latest \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

WORKDIR /workspace