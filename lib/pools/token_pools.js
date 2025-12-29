import { SharedArray } from 'k6/data';

export const TOKEN_POOL = new SharedArray('tokens', function () {
return [
	  {
		      to: '0xTokenContract',
		      data: '0x70a08231000000000000000000000000ACCOUNT',
		    },
];

