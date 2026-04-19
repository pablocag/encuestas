#!/usr/bin/env bash
# Despliegue Flutter Web → Firebase Hosting.
# Requisitos: Flutter, firebase-tools (`npm i -g firebase-tools`), `firebase login`.
# Uso: chmod +x tool/deploy_web_firebase.sh && ./tool/deploy_web_firebase.sh

set -euo pipefail
cd "$(dirname "$0")/.."

if [[ -f .env ]]; then
  echo "Compilando web con --dart-define-from-file=.env ..."
  flutter build web --release --dart-define-from-file=.env
else
  echo "Aviso: no hay .env; flutter build web sin dart-define-from-file."
  flutter build web --release
fi

cd firebase
echo "Desplegando solo Hosting..."
firebase deploy --only hosting
