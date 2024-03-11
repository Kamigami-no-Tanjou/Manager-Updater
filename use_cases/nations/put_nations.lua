---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 11/03/2024 11:46
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local prototype = require('entities.nation')
local escaper = require('utils.extra_function_escape')
local query_builder = require('utils.query_builder')
local errors = require('utils.errors')

local put_nations = {
    vocab = {
        table_name = "Nations",
        primary_key = { db = "ID", prop = "id" },
        editable_columns = {
            name = "Name",
            calendar = "Calendar",
            foundation_date = "FoundationDate",
            destruction_date = "DestructionDate",
            description = "Description"
        }
    }
}

function put_nations.execute(request, response)
    local connection, env = connector.create()
    if not connection then return end
    escaper.set_connection(connection)

    local edited_nations = json.decode(request:receiveBody())
    local queries = query_builder.create_update_queries(
            put_nations.vocab,
            prototype,
            edited_nations,
            escaper
    )

    if type(queries) ~= "string" then
        errors.incorrect_data(response, { nation = queries }, connection, env)
        return
    end
    if not connection:execute(queries) then
        errors.foreign_value_not_found(
                response,
                { "calendar", "nation" },
                connection,
                env
        )
        return
    end

    response:sendOnlyHeaders()
    put_nations.close(connection, env)
end

function put_nations.close(connection, env)
    connection:close()
    env:close()
end

return put_nations