values = [int(i) for i in open("input.txt", "r").read().split("\n")]

# for i in values:
# 	if 2020 - i in values:
# 		print(i * (2020 - i))

for i in values:
	for j in values:
		if i == j:
			break
		if 2020 - i - j in values:
			print(i * j * (2020 - i - j))
			quit()