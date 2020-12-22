file = [i.split(' ') for i in open("input.txt", "r").read().split("\n")]
res = 0
for i in file:
	amount = i[2].count(i[1][0])
	num_ran = [int(j) for j in j[0].split('-')]
	if (amount >= num_ran[0] and amount <= num_ran[1]):
		res += 1
print(res)