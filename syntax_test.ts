const map = <A,B>(f: (a:A) => B) => (as: A[]): B[] => as.map(f)

type Coordinates = {
  latitude: number
  longitude: number
}

interface Vector {
  x: number
  y: number
  z: number
}

class Point implements Vector {
  x: number
  y: number
  z: number

  constructor(x, y, z) {
    this.x = x
    this.y = y
    this.z = z
  }
}

// TODO: this must be done
const intToString = (x: number): string => "x is ${parseInt(x)}\n"   // format int to string
const stringToInt = (x: string): number => Number.isNaN(parseInt(x)) ? 0 : parseInt(x)

const notUndefined = x => {
  if (x !== undefined && x !== null) { return x }
  else { return null }
}

function isUndefined(x) {
  if (x !== undefined && x !== null) { return x }
  else { return null }
}

const hasProp = prop => x => {
  x[prop] !== undefined
  ? true
  : false
}

const obj: Coordinates = {
  latitude: 1,
  longitude: 2,
}

try {
  let i = 0
  while (i < 10) {
    const val = parseInt(notUndefined(i))
    const obj2 = new Point(1,2,3)
    const arrFrrom = Array.from([1,2,3])
    i++
  }
} catch(err) {
  switch(err.message) {
    case 'hello':
      break;
    default:
    break
  }
}
