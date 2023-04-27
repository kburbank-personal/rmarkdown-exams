function Div(el)
        return {
          pandoc.RawBlock("latex", "\\begin{" .. el.classes[1] .. "}"),
          el,
          pandoc.RawBlock("latex", "\\end{" .. el.classes[1] .. "}")
        }
end

function Str(e)
  if e.text == "@q" then
    return pandoc.RawInline("latex", "\\question")
elseif string.find(e.text,"^@q") then
    return pandoc.RawInline("latex", "\\question["..string.match(e.text,"%d+").."]")
  elseif e.text == "@p" then
    return pandoc.RawInline("latex", "\\part")
  elseif string.find(e.text,"^@p") then
    return pandoc.RawInline("latex", "\\part["..string.match(e.text,"%d+").."]")
  elseif e.text == "@bsol" then
      return pandoc.RawInline("latex", "\\begin{solution}")
  elseif e.text == "@ensol" then
      return pandoc.RawInline("latex", "\\end{solution}")
  elseif e.text == "@bparts" then
      return pandoc.RawInline("latex", "\\begin{parts}")
  elseif e.text == "@enparts" then
      return pandoc.RawInline("latex", "\\end{parts}")
    elseif e.text == "@bsubparts" then
      return pandoc.RawInline("latex", "\\begin{parts}")
  elseif e.text == "@ensubparts" then
      return pandoc.RawInline("latex", "\\end{parts}")
  else
    return e
  end
end