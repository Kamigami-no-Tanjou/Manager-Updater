---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 18/02/2024 12:13
---
local mapper = {
    fetch_results = {}
}

function mapper.fetch_results.as_table(query_result, profile)
    local output_table = {}

    local row = query_result:fetch({}, "a")
    local i = 1
    while row do
        mapper.map(row, profile)
        output_table[i] = row

        row = query_result:fetch({}, "a")
        i = i + 1
    end

    return output_table
end

function mapper.fetch_results.as_object(query_result, prototype)
    local output_object = {}

    local row = query_result:fetch({}, "a")
    local i = 1
    while row do
        mapper.map(row, prototype.profile or {})
        output_object[i] = prototype:new(row)

        row = query_result:fetch({}, "a")
        i = i + 1
    end

    return output_object
end

function mapper.map(item, profile)
    for prop, apply_map in pairs(profile) do
        item[prop] = apply_map(item[prop])
    end
end

return mapper
