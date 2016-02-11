
{render} = require "./src/compact.coffee"

data =
  string: 1
  list: [
    {a: 1, b: 2}
    {a: 1, b: 2, c: null}
    {a: 1, b: 2, c: {d: 3}}
    {list: [
      1, 3, 4,
      {x: 3, c: 6}
      1, 5, "string"
      ]}
  ]

console.log render data