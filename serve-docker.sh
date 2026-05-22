#!/usr/bin/env bash
# Vista previa con Docker (no requiere ruby-dev ni compilar gems).
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker no está instalado. Instala Docker o usa: ./serve-local.sh"
  exit 1
fi

echo "Sitio en http://127.0.0.1:4000 (Ctrl+C para salir)"
docker compose up
