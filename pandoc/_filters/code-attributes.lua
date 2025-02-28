function CodeBlock(el)
    -- Handle mermaid blocks
    if el.classes and el.classes[1] == "mermaid" then
        return pandoc.RawBlock("html", '<pre class="mermaid">\n' .. el.text .. '\n</pre>')
    end

    -- Handle other code blocks
    local attrs = {}
    
    -- Move class from pre to code
    if el.classes and el.classes[1] then
        attrs.class = el.classes[1]
    end
    
    -- Move data-line-numbers to code element if present
    if el.attributes and el.attributes["data-line-numbers"] then
        attrs["data-line-numbers"] = el.attributes["data-line-numbers"]
    end
    
    -- Convert attributes table to HTML attribute string
    local attrs_str = ""
    for key, value in pairs(attrs) do
        attrs_str = attrs_str .. string.format(' %s="%s"', key, value)
    end
    
    -- Create HTML with attributes on code element instead of pre
    return pandoc.RawBlock('html', string.format('<pre><code%s>%s</code></pre>', 
        attrs_str,
        el.text))
end
