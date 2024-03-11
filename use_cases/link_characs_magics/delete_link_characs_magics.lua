---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 11/03/2024 12:16
---
local http = require('enums.http_facade')
local delete = require('use_cases.generic.delete')

local delete_links_characs_magics = {
    vocabulary = {
        table = "LINK_CharacsMagics",
        id_column = "ID",
        querystring_property_name = "ids"
    }
}

function delete_links_characs_magics.execute(request, response)
    delete
            .set_id_column(delete_links_characs_magics.vocabulary.id_column)
            .set_queried_table(delete_links_characs_magics.vocabulary.table)
            .set_querystring_property_name(delete_links_characs_magics.vocabulary.querystring_property_name)

    if not delete.execute(request, response) then
        response
                :statusCode(http.codes.NOT_FOUND)
                :sendOnlyHeaders()
    end

    response:sendOnlyHeaders()
end

return delete_links_characs_magics
