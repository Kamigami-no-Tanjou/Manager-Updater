---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 18/02/2024 12:12
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local mapper = require('utils.mapper')
local prototype = require('entities.charac_event')

local get_charac_events = {
    query = [[
        SELECT
            ID AS id,
            StartingDate AS starting_date,
            EndingDate AS ending_date,
            Charac AS charac,
            Description AS description
        FROM CharacEvents
    ]]
}

function get_charac_events.execute(_, response)
    local charac_events = {}
    local connection, env = connector.create()
    if not connection then return end

    local result = connection:execute(get_charac_events.query)
    charac_events = mapper.fetch_results.as_object(result, prototype)

    response:write(json.encode(charac_events))
    result:close()
    connection:close()
    env:close()
end

return get_charac_events
