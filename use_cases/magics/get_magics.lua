---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 24/02/2024 11:54
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local mapper = require('utils.mapper')
local prototype = require('entities.magic')

local get_magics = {
    query = [[
        SELECT
            ID AS id,
            Name AS name,
            Description AS description
        FROM Magics
    ]]
}

function get_magics.execute(_, response)
    local connection, env = connector.create()
    if not connection then return end

    local result = connection:execute(get_magics.query)
    local magics = mapper.fetch_results.as_object(result, prototype)

    response:write(json.encode(magics))
    result:close()
    connection:close()
    env:close()
end

return get_magics