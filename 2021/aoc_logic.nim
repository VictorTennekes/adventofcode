include prelude

## Grid and point
type Grid*[T] = seq[seq[T]]
type Point* = (int, int)
func x*(p:Point):int = p[0]
func y*(p:Point):int = p[1]

const
 directions9* = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 0), (0, 1), (1, -1), (1, 0), (1, 1)]
 directions8* = [(-1, -1), (0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 1), (-1, 0)]
 directions4* = [(0, -1), (1, 0), (0, 1), (-1, 0)]

func height*(data:Grid):int = len data
func width*(data:Grid):int = len data[0]

template `[]`*[T](data:Grid[T], index:Point):T =
 data[index.y][index.x]
template `[]=`*[T](data: var Grid[T], index: Point, val: T) =
 data[index.y][index.x] = val