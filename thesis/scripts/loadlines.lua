function load_lines(name, a, b)
    local lines = {}
    for line in io.lines(name) do
        lines[#lines+1] = line
    end 

    for i = a,b,1 do
        tex.print(lines[i])
    end
end
