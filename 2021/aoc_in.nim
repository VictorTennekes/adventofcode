include prelude
import httpclient, net

var day = 0
if paramCount() == 0:
 day = getDateStr()[8..^1].parseInt
elif paramCount() == 1:
 day = paramStr(1).parseInt
else:
 echo "Invalid amount of parameters passed"
 quit()
let filename = fmt"day{day}/input.txt"
let dirname = fmt"day{day}"
if not dirExists dirname:
 createDir dirname
if fileExists filename:
 echo fmt"{filename} already exists"
 quit()
echo fmt"Downloading input for day {day}."
let client = newHttpClient()
client.headers["cookie"] = readFile "session"
let input = client.getContent(fmt"https://adventofcode.com/2021/day/{day}/input")
filename.writeFile(input)