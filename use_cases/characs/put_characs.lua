---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 08/03/2024 13:57
---
local json = require('lunajson')
local connector = require('utils.database_connection')
local prototype = require('entities.charac')
local escaper = require('utils.extra_function_escape')
local query_builder = require('utils.query_builder')
local errors = require('utils.errors')

local put_characs = {
    vocab = {
        table_name = "Characs",
        primary_key = { db = "ID", prop = "id" },
        editable_columns = {
            last_names = "LastNames",
            first_names = "FirstNames",
            description = "Description",
            calendar = "Calendar",
            birthdate = "Birthdate",
            deathdate = "Deathdate",
            magical_potential = "MagicalPotential",
            class = "Class",
            sex = "Sex",
            gender = "Gender",
            sexual_orientation = "SexualOrientation",
            origin = "Origin",
            height = "Height",
            hair_colour = "HairColour",
            eye_colour = "EyeColour",
            appearance = "Appearance",
            favourite_colour = "FavoriteColour",
            things_loved = "ThingsLoved",
            things_hated = "ThingsHated"
        }
    }
}

function put_characs.execute(request, response)
    local connection, env = connector.create()
    if not connection then return end
    escaper.set_connection(connection)

    local edited_characs = json.decode(request:receiveBody())
    local queries = query_builder.create_update_queries(
            put_characs.vocab,
            prototype,
            edited_characs,
            escaper
    )

    if type(queries) ~= "string" then
        errors.incorrect_data(response, { charac = queries }, connection, env)
        return
    end
    if not connection:execute(queries) then
        errors.foreign_value_not_found(
                response,
                { "character", "calendar", "class", "sex", "gender", "origin" },
                connection,
                env
        )
        return
    end

    response:sendOnlyHeaders()
    put_characs.close(connection, env)
end

function put_characs.close(connection, env)
    connection:close()
    env:close()
end

return put_characs
