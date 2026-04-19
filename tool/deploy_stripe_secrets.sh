#!/usr/bin/env bash
# Sube secretos Stripe a Secret Manager desde .env en la raíz del repo.
# Uso: ./tool/deploy_stripe_secrets.sh
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="$ROOT/.env"
PROJECT="encuestas-prometheus-9tzwei"
cd "$ROOT/firebase"

get_env() {
  local key="$1"
  grep -E "^\s*${key}=" "$ENV_FILE" | tail -1 | cut -d= -f2- | sed 's/^["'\'']//;s/["'\'']$//' | tr -d '\r'
}

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Falta $ENV_FILE" >&2
  exit 1
fi
LIVE="$(get_env STRIPE_SECRET_KEY_LIVE)"
TEST="$(get_env STRIPE_SECRET_KEY_TEST)"
if [[ -z "$LIVE" || -z "$TEST" ]]; then
  echo "STRIPE_SECRET_KEY_LIVE y STRIPE_SECRET_KEY_TEST deben estar en .env" >&2
  exit 1
fi

TMP_LIVE="$(mktemp)"
TMP_TEST="$(mktemp)"
trap 'rm -f "$TMP_LIVE" "$TMP_TEST"' EXIT
printf '%s' "$LIVE" >"$TMP_LIVE"
printf '%s' "$TEST" >"$TMP_TEST"

echo "Subiendo STRIPE_SECRET_KEY_LIVE..."
firebase functions:secrets:set STRIPE_SECRET_KEY_LIVE --data-file "$TMP_LIVE" --project "$PROJECT" --force
echo "Subiendo STRIPE_SECRET_KEY_TEST..."
firebase functions:secrets:set STRIPE_SECRET_KEY_TEST --data-file "$TMP_TEST" --project "$PROJECT" --force

echo ""
echo "Despliega: cd firebase && firebase deploy --only functions --project $PROJECT"
