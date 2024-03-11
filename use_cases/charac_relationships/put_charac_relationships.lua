---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 11/03/2024 09:40
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local prototype = require('entities.charac_relationship')
local escaper = require('utils.extra_function_escape')
local query_builder = require('utils.query_builder')
local errors = require('utils.errors')

local put_charac_relationships = {
    vocab = {
        table_name = "CharacsRelationships",
        primary_key = { db = "ID", prop = "id" },
        editable_columns = {
            from_charac = "FromCharac",
            towards_charac = "TowardsCharac",
            family_status = "FamilyStatus",
            appreciation = "Appreciation",
            history = "History"
        }
    }
}

function put_charac_relationships.execute(request, response)
    local connection, env = connector.create()
    if not connection then return end
    escaper.set_connection(connection)

    local edited_charac_relationships = json.decode(request:receiveBody())
    local queries = query_builder.create_update_queries(
            put_charac_relationships.vocab,
            prototype,
            edited_charac_relationships,
            escaper
    )

    if type(queries) ~= "string" then
        errors.incorrect_data(response, { charac_relationship = queries }, connection, env)
        return
    end
    if not connection:execute(queries) then
        errors.foreign_value_not_found(
                response,
                { "character", "family status", "character relationship" },
                connection,
                env
        )
        return
    end

    response:sendOnlyHeaders()
    put_charac_relationships.close(connection, env)
end

function put_charac_relationships.close(connection, env)
    connection:close()
    env:close()
end

return put_charac_relationships
