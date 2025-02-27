function RawInline(el)
    if el.format == "html" then
        local new_text = el.text:gsub("%$revealjs%-url%$", "https://unpkg.com/reveal.js@^4")
        if new_text ~= el.text then
            return pandoc.RawInline("html", new_text)
        end
    end
    return el
end

function RawBlock(el)
    if el.format == "html" then
        local new_text = el.text:gsub("%$revealjs%-url%$", "https://unpkg.com/reveal.js@^4")
        if new_text ~= el.text then
            return pandoc.RawBlock("html", new_text)
        end
    end
    return el
end