import strutils

let input = readFile("input.txt").split("\n")

for num in input:
    let curr_val = parseInt(num)
    let res = (2020 - curr_val)
    if $res in input:
        echo curr_val * res