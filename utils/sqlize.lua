---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 19/02/2024 13:33
---
return function(value)
    local sql_value

    if type(value) == "string" and value == "%NULL%" then
        sql_value = "NULL"
    elseif type(value) == "string" then
        sql_value = string.format("'%s'", value)
    end

    return sql_value
end
