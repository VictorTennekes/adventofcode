from collections import deque

players = open("input.txt", "r").read().split("\n\n")

player1 = deque([int(i) for i in players[0].split("\n")[1:]])
player2 = deque([int(i) for i in players[1].split("\n")[1:]])
states = []

def game(player1, player2):
	while len(player1) > 0 and len(player2) > 0:
		state = player1 + player2
		if state in states:
			break
		else:
			states.append(state)

		card1 = player1.popleft()
		card2 = player2.popleft()
		if card1 > card2:
			player1.append(card1)
			player1.append(card2)
		else:
			player2.append(card2)
			player2.append(card1)
	return max(player1, player2)

res = game(player1, player2)

ret = 0
for i in range(1, len(res) + 1):
	ret += res.pop() * i
print(ret)