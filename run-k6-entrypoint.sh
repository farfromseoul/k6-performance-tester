#!/usr/bin/env bash
set -e

CASE=$1
RPC_URL=$2

if [[ -z "$CASE" || -z "$RPC_URL" ]]; then
  echo "Usage: $0 <case1|case2|case3|case4> <RPC_URL>"
  echo "RPC EndPoint: https://public-en.node.kaia.io"
  exit 1
fi

export RPC_URL

case "$CASE" in
  case1) k6 run case/case1_balance_latest.js ;;
  case2) k6 run case/case2_balance_block.js ;;
  case3) k6 run case/case3_token_latest.js ;;
  case4) k6 run case/case4_token_block.js ;;
  *)
    echo "Invalid case"
    exit 1
    ;;
esac

