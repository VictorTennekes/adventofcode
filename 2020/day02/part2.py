file = [i.split(' ') for i in open("input.txt", "r").read().split("\n")]
res = 0
for i in file:
	num_ran = [int(j) for j in i[0].split('-')]
	if sum(1 for q in num_ran if i[2][q-1] == i[1][0]) == 1:
		res += 1
print(res)