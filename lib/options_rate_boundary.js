import { baseOptions } from './base_options.js';

export const options = {
  ...baseOptions,
  scenarios: {
    rpc_rate: {
      executor: 'constant-arrival-rate',
      rate: 2000,
      timeUnit: '1s',
      duration: '5m',
      preAllocatedVUs: 300,
      maxVUs: 1000,
    },
  },
};

