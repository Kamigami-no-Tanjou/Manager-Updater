---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 24/02/2024 12:30
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local mapper = require('utils.mapper')
local prototype = require('entities.nation_leader')

local get_nation_leaders = {
    query = [[
        SELECT
            ID AS id,
            Leader AS leader,
            Nation AS nation,
            LeadStartDate AS lead_start_date,
            LeadEndDate AS lead_end_date
        FROM NationsLeaders
    ]]
}

function get_nation_leaders.execute(_, response)
    local connection, env = connector.create()
    if not connection then return end

    local result = connection:execute(get_nation_leaders.query)
    local nation_leaders = mapper.fetch_results.as_object(result, prototype)

    response:write(json.encode(nation_leaders))
    result:close()
    connection:close()
    env:close()
end

return get_nation_leaders
