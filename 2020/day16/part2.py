import re
from collections import defaultdict

def readTickets(sections):
	rules = []
	for i in sections[0].split("\n"):
		i = re.split(" or |-", i[i.find(": ") + 2:])
		rules.append([int(i) for i in i])
	own_ticket = [int(i) for i in sections[1].split("\n")[1].split(",")]
	tickets = []
	first = False
	for i in sections[2].split("\n"):
		if first != True:
			first = True
			continue
		tickets.append([int(j) for j in i.split(",")])
	return (rules, own_ticket, tickets)

def allValid(rules):
	res = []
	for i in rules:
		res += [*range(i[0], i[1] + 1)]
		res += [*range(i[2], i[3] + 1)]
	return res

def validRangeCalc(rule):
	res = [*range(rule[0], rule[1] + 1)]
	res += [*range(rule[2], rule[3] + 1)]
	return res

def validTicket(ticket, allValid):
	for i in ticket:
		if i not in allValid:
			return False
	return True

sections = open("input.txt", "r").read().split("\n\n")
rules, ownTicket, tickets = readTickets(sections)
allValid = allValid(rules)
validTickets = []

for i in range(len(tickets)):
	if validTicket(tickets[i], allValid):
		validTickets.append(tickets[i])
options = defaultdict(list)

for i in range(len(rules)):
	validRange = validRangeCalc(rules[i])
	for x in range(len(tickets[0])):
		if all(tick[x] in validRange for tick in validTickets):
			options[i].append(x)

notDone = True
while notDone:
	notDone = False
	for opt in options:
		if len(options[opt]) == 1:
			index = options[opt][0]
			for p in options:
				if opt != p and index in options[p]:
						options[p].remove(index)
		for opt in options:
			if len(options[opt]) > 1:
				notDone = True

for i in range(len(rules)):
	print(str(i).ljust(2), end=' ')
	for j in range(len(ownTicket)):
		print('[', "\033[32mX\033[37m" if j in options[i] else " ", "]", end='', sep='')
	print("")

res = 1
for i in range(6):
	res *= ownTicket[options[i][0]]
print(res)