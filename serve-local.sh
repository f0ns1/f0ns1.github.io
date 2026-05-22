#!/usr/bin/env bash
# Vista previa local con Ruby nativo (requiere ruby3.3-dev).
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -f /usr/include/ruby-3.3.0/ruby.h ] && [ ! -f /usr/include/ruby.h ]; then
  echo "Faltan headers de Ruby. Instálalos con:"
  echo "  sudo apt install ruby3.3-dev build-essential"
  echo ""
  echo "O usa Docker (sin instalar nada más):"
  echo "  ./serve-docker.sh"
  exit 1
fi

bundle config set --local path 'vendor/bundle'
bundle install
bundle exec jekyll serve --host 127.0.0.1 --livereload
