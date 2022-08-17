-- used to essentially import code from a file and show it in the text

function showcode(args, kwargs)
    local file = pandoc.utils.stringify(args[1])
    local fname = pandoc.path.filename(file)

    local fhandle = io.open(file)
    if not fhandle then return nil end

    -- allow the user to skip lines, useful for skipping common preambles
    local skips = tonumber(pandoc.utils.stringify(kwargs["skiplines"])) or 0
    if skips > 0 then
        for i=1,skips,1 do
            local _ = fhandle:read("*line")
        end
    end

    local content = fhandle:read("*a")
    fhandle:close()

    local language = pandoc.utils.stringify(kwargs["language"])
    if language == pandoc.utils.stringify('') then
        _, language = pandoc.path.split_extension(file)
    end

    return pandoc.Div{
        pandoc.Code(fname),
        pandoc.CodeBlock(content, {class=language}),
    }

end
