import { rpcCall } from '../lib/base_client.js';
import { tokenLatestPayload } from '../lib/payloads.js';
import { RPC_METHOD } from '../lib/enums/rpc_method.js';
import { options } from '../lib/options_ramping_vus_simple.js';

export { options };

export default function () {
	  rpcCall(RPC_METHOD.CALL, tokenLatestPayload());
}

