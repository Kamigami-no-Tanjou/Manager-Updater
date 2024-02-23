---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 23/02/2024 23:10
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local mapper = require('utils.mapper')
local prototype = require('entities.charac_relationship')

local get_charac_relationships = {
    query = [[
        SELECT
            ID AS id,
            FromCharac AS from_charac,
            TowardsCharac AS towards_charac,
            FamilyStatus AS family_status,
            Appreciation AS appreciation,
            History AS history
        FROM CharacsRelationships
    ]]
}

function get_charac_relationships.execute(_, response)
    local connection, env = connector.create()
    if not connection then return end

    local result = connection:execute(get_charac_relationships.query)
    local charac_relationships = mapper.fetch_results.as_object(result, prototype)

    response:write(json.encode(charac_relationships))
    result:close()
    connection:close()
    env:close()
end

return get_charac_relationships