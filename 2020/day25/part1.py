data = [int(i) for i in open("input.txt", "r").read().split("\n")]

loop = 0
res = 1
while res != data[0]:
	res = (res * 7) % 20201227
	loop += 1

res = 1
for _ in range(loop):
	res = res * data[1] % 20201227
print(res)