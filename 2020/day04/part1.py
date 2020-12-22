import re
passes = [re.split(' |\n', i) for i in open("input.txt", "r").read().split("\n\n")]
res = 0
for i in passes:
	if len(i) == 8:
		res += 1
	elif len(i) == 7:
		if "cid" not in [j.split(":")[0] for j in i]:
			res += 1
print(res)