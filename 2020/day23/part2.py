nums = [int(i) for i in "653427918"]

cups = {}
prev = None
for i in range(len(nums)-1, -1, -1):
	cups[nums[i]] = prev
	prev = nums[i]
for i in range(int(1e6), 9, -1):
	cups[i] = prev
	prev = i

cups[nums[-1]] = 10
cur = nums[0]

for _ in range(int(1e7)):
	remove1 = cups[cur]
	remove2 = cups[remove1]
	remove3 = cups[remove2]
	cups[cur] = cups[remove3]

	removed = {cur, remove1, remove2, remove3}
	cval = cur
	while cval in removed:
		cval -= 1
		if cval == 0:
			cval = int(1e6)
	targetLoc = cval
	afterTarget = cups[targetLoc]
	cups[cval] = remove1
	cups[remove3] = afterTarget
	cur = cups[cur]

remove1 = cups[1]
remove2 = cups[remove1]
print (remove1 * remove2)

# 72772522064