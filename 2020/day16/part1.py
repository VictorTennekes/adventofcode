import re

def readTickets(sections):
	ranges = []
	for i in sections[0].split("\n"):
		i = i[i.find(": ") + 2:]
		i = re.split(" or |-", i)
		ranges.append([int(i) for i in i])
	own_ticket = [int(i) for i in sections[1].split("\n")[1].split(",")]
	tickets = []
	first = False
	for i in sections[2].split("\n"):
		if first != True:
			first = True
			continue
		tickets.append([int(j) for j in i.split(",")])
	return (ranges, own_ticket, tickets)

def validTicket(ticket, ranges):
	res = 0
	for i in ticket:
		wrong = 0
		for j in ranges:
			if (i < j[0] or i > j[1]) and (i < j[2] or i > j[3]):
				wrong += 1
		if wrong == len(ranges):
			res += i
	return (res)


res = 0
sections = open("input.txt", "r").read().split("\n\n")
ranges, own_ticket, tickets = readTickets(sections)
for i in tickets:
	res += validTicket(i, ranges)
print(res)