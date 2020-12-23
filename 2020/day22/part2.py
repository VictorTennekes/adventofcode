from collections import deque

players = open("input.txt", "r").read().split("\n\n")

player1 = deque([int(i) for i in players[0].split("\n")[1:]])
player2 = deque([int(i) for i in players[1].split("\n")[1:]])

def sizeDeque(deque, size):
	while len(deque) > size:
		deque.pop()
	return(deque)

def addWin(deque, card1, card2):
	deque.append(card1)
	deque.append(card2)

def game(player1, player2):
	states = set()
	while len(player1) > 0 and len(player2) > 0:
		tuple1, tuple2 = tuple(player1), tuple(player2)
		if (tuple1, tuple2) in states:
			return player1, []
		states.add((tuple1, tuple2))
		card1 = player1.popleft()
		card2 = player2.popleft()


		if card1 <= len(player1) and card2 <= len(player2):
			subDeck1, subDeck2 = game(sizeDeque(player1.copy(), card1), sizeDeque(player2.copy(), card2))
			player1Wins = len(subDeck1) > 1
		else:
			player1Wins = card1 > card2

		if player1Wins:
			addWin(player1, card1, card2)
		else:
			addWin(player2, card2, card1)
	return player1, player2

player1, player2 = game(player1, player2)

res = player1 if player1 else player2
ret = 0
for i in range(1, len(res) + 1):
	ret += res.pop() * i
print(ret) 