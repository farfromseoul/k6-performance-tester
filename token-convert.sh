#!/usr/bin/env bash

INPUT_FILE="tokens.txt"
OUTPUT_FILE="tokens.js"

cat > "$OUTPUT_FILE" <<'EOF'
import { SharedArray } from 'k6/data';

export const TOKEN_POOL = new SharedArray('tokens', function () {
  return [
EOF

sed 's/^\([^,]*\),\(.*\)$/    { to: '\''\1'\'', data: '\''\2'\'' },/' "$INPUT_FILE" \
  >> "$OUTPUT_FILE"

cat >> "$OUTPUT_FILE" <<'EOF'
  ];
});
EOF

