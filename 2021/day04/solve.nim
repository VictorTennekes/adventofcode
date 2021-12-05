include prelude

let
 input = readFile("input.txt").strip.split("\n\n")
 size = input.len

type Card = seq[string]

func getCards(rawCards: seq[string]): seq[Card] =
 var cards: seq[seq[string]]
 for i in rawCards:
  var card: Card
  for j in i.splitLines:
   card.add(j.split(" ").filterIt(it.len != 0))
  cards.add(card)
 return cards

func updateCard(card: Card, number: string): Card =
 result = card
 for i in 0..result.high:
  if result[i] == number:
   result[i] = "x"
 return result

func checkCard(card: Card): bool =
 for i in 0..4:
  var tmp = card[i*5..i*5+4].join
  if tmp == "xxxxx":
   return true
 for i in 0..4:
  var tmp = ""
  for j in 0..4:
   tmp.add(card[i + (j  * 5)])
  if tmp == "xxxxx":
   return true
 return false

func calcScore(card: Card, num: string): int =
 for i in card:
  if i != "x":
   result += parseInt(i)
 result *= parseInt(num)

proc solve() =
 var
  cards = getCards(input[1..size-1])
  winners: seq[int]
  latestWin: Card
  latestNum: string
  firstWin = false

 for num in input[0].split(","):
  for j in 0..cards.high:
   if j notin winners:
    cards[j] = updateCard(cards[j], num)
    if checkCard(cards[j]) == true:
     if firstWin == false:
      echo "part 1: ", calcScore(cards[j], num)
      firstWin = true
     latestWin = cards[j]
     latestNum = num
     winners.add(j)
 echo "part 2: ", calcScore(latestWin, latestNum)
    

solve()