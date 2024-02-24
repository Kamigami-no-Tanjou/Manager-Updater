---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 16/02/2024 11:10
---
local routing = {}
local http = require('enums.http_facade')
local logger = require('utils.logger')
local security = require('utils.security')

local health_use_case = require('use_cases.server.health')
local get_calendars_use_case = require('use_cases.calendars.get_calendars')
local get_charac_events_use_case = require('use_cases.charac_events.get_charac_events')
local post_charac_events_use_case = require('use_cases.charac_events.post_charac_events')
local put_charac_events_use_case = require('use_cases.charac_events.put_charac_events')
local delete_charac_events_use_case = require('use_cases.charac_events.delete_charac_events')
local get_characs_use_case = require('use_cases.characs.get_characs')
-- charac_relationships
local get_charac_relationships_use_case = require('use_cases.charac_relationships.get_charac_relationships')
-- classes; elems; family_statuses; genders
local get_classes_use_case = require('use_cases.classes.get_classes')
local get_elems_use_case = require('use_cases.elems.get_elems')
local get_family_statuses_use_case = require('use_cases.family_statuses.get_family_statuses')
local get_genders_use_case = require('use_cases.genders.get_genders')
local get_links_characs_magics_use_case = require('use_cases.link_characs_magics.get_link_characs_magics')
-- link_elems_magics
local get_links_elems_magics_use_case = require('use_cases.link_elems_magics.get_link_elems_magics')
-- magics
local get_magics_use_case = require('use_cases.magics.get_magics')
routing.routes = {
    -- { "path", "http_method", function_to_call, "name", requires_authentication },
    { "/health", http.methods.GET, health_use_case.execute, "health", false },
    { "/calendars", http.methods.GET, get_calendars_use_case.execute, "get_calendars", false },
    { "/charac-events", http.methods.GET, get_charac_events_use_case.execute, "get_charac_events", false },
    { "/charac-events", http.methods.POST, post_charac_events_use_case.execute, "post_charac_events", true },
    { "/charac-events", http.methods.PUT, put_charac_events_use_case.execute, "put_charac_events", true },
    { "/charac-events", http.methods.DELETE, delete_charac_events_use_case.execute, "delete_charac_events", true },
    { "/characs", http.methods.GET, get_characs_use_case.execute, "get_characs", false },
    { "/charac-relationships", http.methods.GET, get_charac_relationships_use_case.execute, "get_charac_relationships", false },
    { "/classes", http.methods.GET, get_classes_use_case.execute, "get_classes", false },
    { "/elements", http.methods.GET, get_elems_use_case.execute, "get_elems", false },
    { "/family-statuses", http.methods.GET, get_family_statuses_use_case.execute, "get_family_statuses", false },
    { "/genders", http.methods.GET, get_genders_use_case.execute, "get_genders", false },
    { "/link-characs-magics", http.methods.GET, get_links_characs_magics_use_case.execute, "get_links_characs_magics", false },
    { "/link-elems-magics", http.methods.GET, get_links_elems_magics_use_case.execute, "get_links_elems_magics", false },
    { "/magics", http.methods.GET, get_magics_use_case.execute, "get_magics", false },
}

function routing.dispatch(request, response)
    routing.prepareResponse(response)

    for _,value in pairs(routing.routes) do
        local is_allowed = security.check_key(request, value[5])

        if request:path() == value[1] and request:method() == value[2] and is_allowed then
            logger.log(logger.levels.INFO, "Dispatching received request to endpoint " .. value[4] .. "...")
            value[3](request, response)
            return

        elseif request:path() == value[1] and request:method() == value[2] and not is_allowed then
            logger.log(logger.levels.INFO, "Attempted to access " .. value[4] .. " route with no authentication")
            response
                    :statusCode(http.codes.UNAUTHORIZED)
                    :write("{ \"message\": \"You need to give the API key to access this resource!\" }")
            return

        end
    end

    -- info level because this is a client error!
    logger.log(logger.levels.INFO, "No matching route ; returning 404:NOT_FOUND response...")
    response
            :statusCode(http.codes.NOT_FOUND)
            :write("{ \"message\": \"No matching route found. Consider checking the path and the method used.\" }")
end


---
--- Function that will prepare the response to set basic parameters valid everywhere, like the content-type, which should
--- always be  `application/json` in our case.
---
--- @param response Response The response to prepare.
---
function routing.prepareResponse(response)
    response:addHeader("Content-Type", "application/json")
end

return routing
