---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 23/02/2024 23:25
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local mapper = require('utils.mapper')

local get_classes = {
    query = [[
        SELECT
            ID AS id,
            Name AS name
        FROM Classes
    ]]
}

function get_classes.execute(_, response)
    local connection, env = connector.create()
    if not connection then return end

    local result = connection:execute(get_classes.query)
    local classes = mapper.fetch_results.as_table(result, {
        id = tonumber
    })

    response:write(json.encode(classes))
    result:close()
    connection:close()
    env:close()
end

return get_classes
