#!/usr/bin/env bash
set -euo pipefail

#######################################
# usage / help
#######################################
usage() {
  cat <<'EOF'
Usage:
  RPC_URL=<rpc_url> [BLOCK_RANGE=<n>] ./block_height_pool_generator.sh

Required ENV:
  RPC_URL        JSON-RPC endpoint URL
                 (e.g. https://rpc.kaia.io)

Optional ENV:
  BLOCK_RANGE    Number of blocks to include before latest
                 Default: 100

Examples:
  export RPC_URL=https://rpc.kaia.io
  export BLOCK_RANGE=100
  ./block_height_pool_generator.sh

  RPC_URL=https://rpc.kaia.io BLOCK_RANGE=50 ./block_height_pool_generator.sh
EOF
}

#######################################
# help flag 처리
#######################################
if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

#######################################
# ENV validation
#######################################
if [[ -z "${RPC_URL:-}" ]]; then
  echo "[ERROR] RPC_URL is not set"
  echo
  usage
  exit 1
fi

BLOCK_RANGE=${BLOCK_RANGE:-100}
OUT_FILE="./lib/pools/block_pools.js"

#######################################
# main logic
#######################################
echo "[INFO] RPC_URL      : $RPC_URL"
echo "[INFO] BLOCK_RANGE : $BLOCK_RANGE"
echo "[INFO] OUTPUT_FILE : $OUT_FILE"
echo "[INFO] Fetching latest block number..."

LATEST_HEX=$(curl -sf -X POST "$RPC_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc":"2.0",
    "method":"kaia_blockNumber",
    "params":[],
    "id":1
  }' | jq -r '.result')

if [[ -z "$LATEST_HEX" || "$LATEST_HEX" == "null" ]]; then
  echo "[ERROR] Failed to fetch latest block number"
  exit 1
fi

LATEST_DEC=$((16#${LATEST_HEX#0x}))
START=$((LATEST_DEC - BLOCK_RANGE))

echo "[INFO] Latest block : $LATEST_DEC"
echo "[INFO] Block range  : $START ~ $LATEST_DEC"

#######################################
# file generation (overwrite)
#######################################
echo "export const BLOCK_POOLS = [" > "$OUT_FILE"

for ((i=START; i<=LATEST_DEC; i++)); do
  printf '  "0x%x",\n' "$i" >> "$OUT_FILE"
done

echo "];" >> "$OUT_FILE"

echo "[INFO] block_pools.js updated successfully"

