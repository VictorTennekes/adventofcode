def validPass(port):
	if (len(port) < 7):
		return (0)
	if (len(port) == 7):
		if "cid" in [i[0] for i in port]:
			return (0)
	for i in port:
		if (i[0] == "byr"):
			if (int(i[1]) < 1920 or int(i[1]) > 2002):
				return 0
		elif (i[0] == "iyr"):
			if (int(i[1]) < 2010 or int(i[1]) > 2020):
				return 0
		elif (i[0] == "eyr"):
			if (int(i[1]) < 2020 or int(i[1]) > 2030):
				return 0
		elif (i[0] == "hgt"):
			if (i[1][-2:] == "cm"):
				if (int(i[1][:-2]) < 150 or int(i[1][:-2]) > 193):
					return (0)
			elif (i[1][-2:] == "in"):
				if (int(i[1][:-2]) < 59 or int(i[1][:-2]) > 76):
					return (0)
			else:
				return (0)
		elif (i[0] == "hcl"):
			if i[1][0] != '#':
				return (0)
			try:
				int(i[1][1:], 16)
			except:
				return (0)
		elif (i[0] == "ecl"):
			if i[1] not in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]:
				return (0)
		elif (i[0] == "pid"):
			if not i[1].isdigit() or len(i[1]) != 9:
				return (0)
	return (1)

import re
passes = [re.split(' |\n', i) for i in open("input.txt", "r").read().split("\n\n")]
res = 0
for i in passes:
	port = [j.split(":") for j in i]
	print(port)
	res += validPass(port)
print(res)