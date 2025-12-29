import { SharedArray } from 'k6/data';

export const BLOCK_POOLS = new SharedArray('blocks', function () {
return [
  "0xc35257b",
  "0xc35257c",
  "0xc35257d",
  "0xc35257e",
  "0xc35257f",
  "0xc352580",
  "0xc352581",
  "0xc352582",
  "0xc352583",
  "0xc352584",
  "0xc352585",
];
});
