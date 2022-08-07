-- Print tables made of numbers.
function puttable(elements, columns)

    s = ""
    lines = #elements/columns
    if style == "int" then
        fmt = "\\num{%s} & "
        fmt_last = "\\num{%s} \\\\"
    else
        fmt = "\\num{%s} & "
        fmt_last = "\\num{%s} \\\\"
    end

    for i = 1, lines do
        for j = 1, columns-1 do
            s = s..fmt:format( tostring(elements[(i-1)*columns+j]) )
        end
        s = s..fmt_last:format( tostring(elements[(i-1)*columns+columns]) )
    end

    tex.print(s)
end

