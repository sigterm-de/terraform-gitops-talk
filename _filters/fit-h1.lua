function Header(el)
  if el.level == 1 then
    el.classes:insert('r-fit-text')
  end
  return el
end