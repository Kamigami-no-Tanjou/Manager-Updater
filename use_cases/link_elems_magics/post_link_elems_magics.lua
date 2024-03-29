---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 07/03/2024 20:54
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local http = require('enums.http_facade')
local prototype = require('entities.link_elems_magics')
local escaper = require('utils.extra_function_escape')
local query_builder = require('utils.query_builder')

local post_link_elems_magics = {
    query = [[
        INSERT INTO LINK_ElemsMagics
        (
            Elem,
            Magic
        )
        VALUES

    ]],

    value = "(%s, %s)"
}

function post_link_elems_magics.execute(request, response)
    local connection, env = connector.create()
    if not connection then return end
    escaper.set_connection(connection)

    local new_links_elems_magics = json.decode(request:receiveBody())
    local query = query_builder.create_insert_query(
            post_link_elems_magics.query,
            post_link_elems_magics.value,
            prototype,
            new_links_elems_magics,
            escaper
    )


    if type(query) ~= "string" then
        post_link_elems_magics.lacking_data(response, query, connection, env)
        return
    end
    if not connection:execute(query) then
        post_link_elems_magics.foreign_value_not_found(response, connection, env)
        return
    end

    response
            :statusCode(http.codes.CREATED)
            :sendOnlyHeaders()
    post_link_elems_magics.close(connection, env)
end

function post_link_elems_magics.lacking_data(response, entity, connection, env)
    response
            :statusCode(http.codes.BAD_REQUEST)
            :write(json.encode({ message = "Detected missing values in this entity", link_elems_magics = entity }))
    post_link_elems_magics.close(connection, env)
end

function post_link_elems_magics.foreign_value_not_found(response, connection, env)
    response
            :statusCode(http.codes.NOT_FOUND)
            :write(json.encode({ message = "Element or magic not found!" }))
    post_link_elems_magics.close(connection, env)
end

function post_link_elems_magics.close(connection, env)
    connection:close()
    env:close()
end

return post_link_elems_magics
