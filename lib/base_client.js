import http from 'k6/http';
import { check } from 'k6';

export function rpcCall(method, params) {
  const payload = JSON.stringify({
    jsonrpc: '2.0',
    method,
    params,
    id: Math.floor(Math.random() * 1e6),
  });

  const res = http.post(__ENV.RPC_URL, payload, {
    headers: { 'Content-Type': 'application/json' },
    tags: { rpc_method: method },
  });

  check(res, {
    'status is 200': r => r.status === 200,
    'jsonrpc ok': r => JSON.parse(r.body)?.jsonrpc === '2.0',
    'no rpc error': r => !JSON.parse(r.body)?.error,
  });

  return res;
}

