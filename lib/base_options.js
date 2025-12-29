export const baseOptions = {
  thresholds: {
    // SLO 1: p95 latency < 1s
    http_req_duration: ['p(95)<1000'],

    // SLO 2: failure rate < 0.01%
    http_req_failed: ['rate<0.01'],

    // SLO 3: correctness >= 99%
    checks: ['rate>=0.99'],
  },
};

