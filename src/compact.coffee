
# string, array, json, number, else

support_types = ["number", "string", "array", "object", 'null']

str = (x) ->
  JSON.stringify x

type = (x) ->
  Object::toString.call(x)
  .match(/\s\w+/)[0]
  .trim().toLowerCase()

render = (content) ->
  buffer = ""
  small_break = no

  dups = (indent) ->
    piece = ""
    if small_break
      small_break = no
      return ""
    while indent > 0
      piece += "  "
      indent -= 1
    piece

  jumps = (indent) ->
    buffer += (dups indent)

  write = (value) ->
    buffer += value

  append = (value) ->
    res = str value
    if render.hide and res.length > 30
      res = res[..10] + "...\"\t[too long]"
    write res
    newline()

  newline = ->
    buffer += "\n"

  append_item = (indent, item) ->
    return unless (type item) in support_types
    jumps indent
    write "- "
    make indent, item, "array"

  append_pair = (indent, key, value) ->
    return unless (type value) in support_types
    jumps indent
    if key.match /[\w\d-]+/
      write key
    else
      write (str key)
    write ": "
    make indent, value, "object"

  make = (indent, data, outer) ->
    switch type data
      when "array"
        if outer is "object"
          indent -= 1
        if outer is "array"
          if data.length
            small_break = yes
          else
            newline()
        else
          newline()
        data.map (item) ->
          append_item (indent + 1), item
      when "object"
        if outer is "array"
          small_break = yes
        else
          newline()
        for key, value of data
          append_pair (indent + 1), key, value
      else
        append data

  make 0, content

  buffer

# loader

if define?
  define {render}
else if exports?
  exports.render = render
else if window?
  window.compactJsonRender = render
