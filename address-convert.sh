#!/usr/bin/env bash

INPUT_FILE="addresse-input.txt"
OUTPUT_FILE="addresse_pool.js"

cat > "$OUTPUT_FILE" <<'EOF'
import { SharedArray } from 'k6/data';

export const ADDRESS_POOLS = new SharedArray('addresses', function () {
  return [
EOF

sed 's/.*/    '\''&'\'',/' "$INPUT_FILE" >> "$OUTPUT_FILE"

cat >> "$OUTPUT_FILE" <<'EOF'
  ];
});
EOF

