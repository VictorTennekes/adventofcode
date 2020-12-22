groups = [i.split("\n") for i in open("input.txt", "r").read().split("\n\n")]
res = 0
for i in "abcdefghijklmnopqrstuvwxyz":
	for j in groups:
		res += sum(i in q for q in j) == len(j)
print(res)