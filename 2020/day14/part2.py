data = open("input.txt", "r").read().split("\n")
memory = {}
mask = ""
for i in range(0, len(data)):
	mem, value = data[i].split(" = ")
	if mem == "mask":
		mask = value
	else:
		value = int(value)
		mem = bin(int(mem[4:-1]))[2:].zfill(36)
		res = ""
		for j in range(0, 36):
			if mask[j] == 'X' or mask[j] == '1':
				res += mask[j]
			else:
				res += mem[j]
		num_poss = res.count("X")
		flucts = []
		for i in range(2**num_poss):
			flucts.append(list(bin(i)[2:].zfill(num_poss)))
		for fluct in flucts:
			i = 0
			nadd = ""
			for a in res:
				if a == "X":
					nadd += str(fluct[i])
					i += 1
				else:
					nadd += str(a)
			memory[int(nadd, 2)] = value
print(sum(memory.values()))