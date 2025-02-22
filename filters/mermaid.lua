function CodeBlock(el)
  if el.classes[1] == "mermaid" then
    -- Replace with <pre class="mermaid"> content
    return pandoc.RawBlock("html", '<pre class="mermaid">\n' .. el.text .. '\n</pre>')
  end
end
