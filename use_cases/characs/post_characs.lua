---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 24/02/2024 17:38
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local http = require('enums.http_facade')
local prototype = require('entities.charac')
local escaper = require('utils.extra_function_escape')
local query_builder = require('utils.query_builder')

local post_characs = {
    query = [[
        INSERT INTO Characs
        (
            LastNames,
            FirstNames,
            Description,
            Calendar,
            Birthdate,
            Deathdate,
            MagicalPotential,
            Class,
            Sex,
            Gender,
            SexualOrientation,
            Origin,
            Height,
            HairColour,
            EyeColour,
            Appearance,
            FavoriteColour,
            ThingsLoved,
            ThingsHated
        )
        VALUES

    ]],

    value = "(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
}

function post_characs.execute(request, response)
    local connection, env = connector.create()
    if not connection then return end
    escaper.set_connection(connection)

    local new_characs = json.decode(request:receiveBody())
    local query = query_builder.create_insert_query(
            post_characs.query,
            post_characs.value,
            prototype,
            new_characs,
            escaper
    )


    if type(query) ~= "string" then
        post_characs.lacking_data(response, query, connection, env)
        return
    end
    if not connection:execute(query) then
        post_characs.foreign_value_not_found(response, connection, env)
        return
    end

    response
            :statusCode(http.codes.CREATED)
            :sendOnlyHeaders()
    post_characs.close(connection, env)
end

function post_characs.lacking_data(response, entity, connection, env)
    response
            :statusCode(http.codes.BAD_REQUEST)
            :write(json.encode({ message = "Detected missing values in this entity", character = entity }))
    post_characs.close(connection, env)
end

function post_characs.foreign_value_not_found(response, connection, env)
    response
            :statusCode(http.codes.NOT_FOUND)
            :write(json.encode({ message = "Calendar, class, sex, gender or origin not found!" }))
    post_characs.close(connection, env)
end

function post_characs.close(connection, env)
    connection:close()
    env:close()
end

return post_characs
