-- Pandoc Lua filter to add the `r-stretch` class to all images

function Image(el)
  -- Check if there are existing classes
  if el.classes then
    -- Add the `r-stretch` class to the image's classes
    table.insert(el.classes, "r-stretch")
  else
    -- If no classes exist, create a table with the `r-stretch` class
    el.classes = { "r-stretch" }
  end
  return el
end
