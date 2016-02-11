
Compact JSON Render
------

Renders:

```coffee
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
```

into:

```
  string: 1
  list:
  - a: 1
    b: 2
  - a: 1
    b: 2
    c: null
  - a: 1
    b: 2
    c:
      d: 3
  - list:
    - 1
    - 3
    - 4
    - x: 3
      c: 6
    - 1
    - 5
    - "string"
```

### Usage

In Node:

```bash
npm install --save compact-json
```

```coffee
data = {} # some data...
{render} = require "compact-json"
console.log (render data)
```

### Options

To avoid print too long content

```coffee
render.hide = true
```

### License

BSD