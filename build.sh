#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

source "$SCRIPT_DIR/config.sh"

OUTPUT_DIR="${OUTPUT_DIR:-$SCRIPT_DIR/build/site}"
PAGE_TITLE="${PAGE_TITLE:-Workshop Demo}"

: "${PAGE_MESSAGE:?PAGE_MESSAGE must be set in config.sh}"

mkdir -p "$OUTPUT_DIR"

cat > "$OUTPUT_DIR/index.html" <<HTML
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>${PAGE_TITLE}</title>
</head>
<body>
  <h1>${PAGE_TITLE}</h1>
  <p>${PAGE_MESSAGE}</p>
</body>
</html>
HTML

printf 'Build complete: %s/index.html\n' "$OUTPUT_DIR"
