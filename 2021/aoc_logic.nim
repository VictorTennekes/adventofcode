## Grid and point
type Grid*[T] = seq[seq[T]]
type Point* = (int, int)
func x*(p:Point):int = p[0]
func y*(p:Point):int = p[1]

const
 directions8* = [(-1, -1), (0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 1), (-1, 0)]
 directions4* = [(0, -1), (1, 0), (0, 1), (-1, 0)]

func height*(data:Grid):int = len data
func width*(data:Grid):int = len data[0]

proc `[]`(self: Grid, point: Point): int =
  self[point.row][point.col]