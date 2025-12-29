import { SharedArray } from 'k6/data';

export const ADDRESS_POOLS = new SharedArray('addresses', function () { 

  return [
	  '0x1111111111111111111111111111111111111111',
	  '0x2222222222222222222222222222222222222222',
];
});

