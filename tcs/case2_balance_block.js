import { rpcCall } from '../lib/base_client.js';
import { balanceBlockPayload } from '../lib/payloads.js';
import { RPC_METHOD } from '../lib/enums/rpc_method.js';
import { options } from '../lib/options_rate_boundary.js';

export { options };

export default function () {
	  rpcCall(RPC_METHOD.GET_BALANCE, balanceBlockPayload());
}

