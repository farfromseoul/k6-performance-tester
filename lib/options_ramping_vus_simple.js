import { baseOptions } from './base_options.js';

export const options = {
  ...baseOptions,
  stages: [
    { duration: '1m', target: 1000 },
    { duration: '1m', target: 2000 },
    { duration: '1m', target: 3000 },
    { duration: '1m', target: 4000 },
    { duration: '1m', target: 5000 },
    { duration: '5m', target: 0 },
  ],
};

