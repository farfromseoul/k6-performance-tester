let index = 0;

export function roundRobinPick(arr) {
	  const val = arr[index % arr.length];
	  index++;
	  return val;
}

