import collections

data = [int(i) for i in open("input.txt", "r").read().split(",")]

spoken = collections.defaultdict(list)
last = None
turn = 1
for num in data:
	spoken[num].append(turn)
	last = num
	turn += 1
while turn <= 30000000:
	if len(spoken[last]) > 1:
		last = spoken[last][-1] - spoken[last][-2]
	else:
		last = 0
	spoken[last].append(turn)
	turn += 1
print(last)