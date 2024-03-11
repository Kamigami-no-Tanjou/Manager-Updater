---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 11/03/2024 11:18
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local prototype = require('entities.map')
local escaper = require('utils.extra_function_escape')
local query_builder = require('utils.query_builder')
local errors = require('utils.errors')

local put_maps = {
    vocab = {
        table_name = "Maps",
        primary_key = { db = "ID", prop = "id" },
        editable_columns = {
            name = "Name",
            establishment_date = "EstablishmentDate",
            expiry_date = "ExpiryDate",
            nation = "Nation"
        }
    }
}

function put_maps.execute(request, response)
    local connection, env = connector.create()
    if not connection then return end
    escaper.set_connection(connection)

    local edited_maps = json.decode(request:receiveBody())
    local queries = query_builder.create_update_queries(
            put_maps.vocab,
            prototype,
            edited_maps,
            escaper
    )

    if type(queries) ~= "string" then
        errors.incorrect_data(response, { map = queries }, connection, env)
        return
    end
    if not connection:execute(queries) then
        errors.foreign_value_not_found(
                response,
                { "nation", "map" },
                connection,
                env
        )
        return
    end

    response:sendOnlyHeaders()
    put_maps.close(connection, env)
end

function put_maps.close(connection, env)
    connection:close()
    env:close()
end

return put_maps
