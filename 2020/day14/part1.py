data = open("input.txt", "r").read().split("\n")
memory = {}
mask = ""
for i in range(0, len(data)):
	if data[i][:4] == "mask":
		mask = data[i][7:]
	else:
		mem, value = data[i].split(" = ")
		mem = mem[4:-1]
		value = bin(int(value))[2:].zfill(36)
		res = ""
		for j in range(0, 36):
			if mask[j] != "X":
				res += mask[j]
			else:
				res += value[j]
		memory[mem] = int(res, 2)
print(sum(memory.values()))