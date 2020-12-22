from collections import defaultdict

all_allergs = defaultdict(set)
all_ingrs = set()

rows = open("input.txt", "r").read().split("\n")
for row in rows:
	x, y = row.split(" (contains ")
	ingrs = set(x.split())
	all_ingrs |= set(ingrs)
	allergs = y[:-1].split(", ")
	for a in allergs:
		if a not in all_allergs:
			all_allergs[a] = set(ingrs)
		else:
			all_allergs[a] &= set(ingrs)

okingrs = set()
for ingr in all_ingrs:
	ok = not any(ingr in x for x in all_allergs.values())
	if ok: okingrs.add(ingr)

count = 0
for row in rows:
	x, y = row.strip().split(" (contains ")
	ingrs = x.split()
	for ingr in ingrs:
		if ingr in okingrs:
			count += 1
print(count)