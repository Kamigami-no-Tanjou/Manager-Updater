---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 24/02/2024 11:36
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local mapper = require('utils.mapper')
local prototype = require('entities.link_charac_magic')

local get_link_characs_magics = {
    query = [[
        SELECT
            ID AS id,
            Charac AS charac,
            Magic AS magic,
            `Rank` AS `rank`
        FROM LINK_CharacsMagics
    ]]
}

function get_link_characs_magics.execute(_, response)
    local connection, env = connector.create()
    if not connection then return end

    local result = connection:execute(get_link_characs_magics.query)
    local link_characs_magics = mapper.fetch_results.as_object(result, prototype)

    response:write(json.encode(link_characs_magics))
    result:close()
    connection:close()
    env:close()
end

return get_link_characs_magics
