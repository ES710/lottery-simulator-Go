#!/usr/bin/env bash
set -euo pipefail

# Devcontainer 内から db サービスに接続してダンプ
OUT=${1:-/workspace/db/init.sql}

mysqldump \
  -h "${DB_HOST:-db}" \
  -u "${MARIADB_USER:-appuser}" \
  -p"${MARIADB_PASSWORD:-apppass}" \
  --databases "${MARIADB_DATABASE:-appdb}" \
  --add-drop-database \
  --routines \
  --triggers \
  --single-transaction \
  --default-character-set=utf8mb4 \
  > "${OUT}"

echo "Dumped to ${OUT}"