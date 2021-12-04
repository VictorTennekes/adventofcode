include prelude

let
 input = readFile("input.txt").strip.split("\n\n")
 size = input.len

let numbers = input[0].split(",")
var cardsRaw = input[1..size-1]

func getCards(rawCards: seq[string]): seq[seq[string]] =
 var cards = newSeq[newSeq[string](0)](0)
 for i in rawCards:
  var lines = i.splitLines
  var card = newSeq[string](0)
  for j in lines:
   card.add(j.split(" ").filterIt(it.len != 0))
  cards.add(card)
 return cards

var cards = getCards(cardsRaw)

func updateCard(card: seq[string], number: string): seq[string] =
 result = card
 for i in 0..result.high:
  if result[i] == number:
   result[i] = "x"
 return result

func checkCard(card: seq[string]): bool =
 for i in 0..4:
  var tmp = ""
  for j in i*5..(i*5)+4:
   tmp.add(card[j])
  if tmp == "xxxxx":
   return true
 for i in 0..4:
  var tmp = ""
  for j in 0..4:
   tmp.add(card[i + (j  * 5)])
  if tmp == "xxxxx":
   return(true)
 return(false)

var latestCardWin = newSeq[string](0)
var latestNum = ""

var winners = newSeq[int](0)
for i in numbers:
 for j in 0..cards.high:
  if j notin winners:
   cards[j] = updateCard(cards[j], i)
   if checkCard(cards[j]) == true:
    latestCardWin = cards[j]
    latestNum = i
    winners.add(j)

var sum = 0
for i in latestCardWin:
  if i != "x":
    sum += parseInt(i)
echo sum * parseInt(latestNum)