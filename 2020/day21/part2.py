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

ingredients = {}
while len(ingredients) < len(all_allergs):
	for c in all_allergs:
		r = [x for x in all_allergs[c] if x not in ingredients]
		if len(r) == 1:
			ingredients[r[0]] = c
			break

v = sorted(ingredients.items(), key=lambda x: x[1])
print(','.join(x[0] for x in v))