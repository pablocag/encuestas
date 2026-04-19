#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
flutter pub get
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
