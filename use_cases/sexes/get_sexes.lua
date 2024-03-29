---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 24/02/2024 12:41
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local mapper = require('utils.mapper')

local get_sexes = {
    query = [[
        SELECT
            ID AS id,
            Name AS name
        FROM Sexes
    ]]
}

function get_sexes.execute(_, response)
    local connection, env = connector.create()
    if not connection then return end

    local result = connection:execute(get_sexes.query)
    local sexes = mapper.fetch_results.as_table(result, {
        id = tonumber
    })

    response:write(json.encode(sexes))
    result:close()
    connection:close()
    env:close()
end

return get_sexes
