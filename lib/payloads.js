import { randomPick } from './selectors/random.js';
import { ADDRESS_POOLS } from './pools/address_pools.js';
import { BLOCK_POOLS } from './pools/block_pools.js';
import { TOKEN_POOLS } from './pools/token_pools.js';
import { BLOCK_TAG } from './enums/block_tag.js';

export function balanceLatestPayload() {
	  return [randomPick(ADDRESS_POOLS), BLOCK_TAG.LATEST];
}

export function balanceBlockPayload() {
	  return [randomPick(ADDRESS_POOLS), randomPick(BLOCK_POOLS)];
}

export function tokenLatestPayload() {
	  const t = randomPick(TOKEN_POOLS);
	  return [{ to: t.contract, data: t.data }, BLOCK_TAG.LATEST];
}

export function tokenBlockPayload() {
	  const t = randomPick(TOKEN_POOLS);
	  return [{ to: t.contract, data: t.data }, randomPick(BLOCK_POOLS)];
}

