---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 16/02/2024 11:10
---
local routing = {}
local http = require('enums.http_facade')
local logger = require('utils.logger')
local security = require('utils.security')
local route_match = require('enums.routing.route_match')

local health_use_case = require('use_cases.server.health')
local get_calendars_use_case = require('use_cases.calendars.get_calendars')
local get_charac_events_use_case = require('use_cases.charac_events.get_charac_events')
local post_charac_events_use_case = require('use_cases.charac_events.post_charac_events')
local put_charac_events_use_case = require('use_cases.charac_events.put_charac_events')
local delete_charac_events_use_case = require('use_cases.charac_events.delete_charac_events')
local get_characs_use_case = require('use_cases.characs.get_characs')
local post_characs_use_case = require('use_cases.characs.post_characs')
local put_characs_use_case = require('use_cases.characs.put_characs')
local delete_characs_use_case = require('use_cases.characs.delete_characs')
local post_charac_portrait = require('use_cases.characs.post_charac_portrait')
local delete_charac_portrait = require('use_cases.characs.delete_charac_portrait')
local get_charac_relationships_use_case = require('use_cases.charac_relationships.get_charac_relationships')
local post_charac_relationships_use_case = require('use_cases.charac_relationships.post_charac_relationships')
local put_charac_relationships_use_case = require('use_cases.charac_relationships.put_charac_relationships')
local delete_charac_relationships_use_case = require('use_cases.charac_relationships.delete_charac_relationships')
local get_classes_use_case = require('use_cases.classes.get_classes')
local get_elems_use_case = require('use_cases.elems.get_elems')
local get_family_statuses_use_case = require('use_cases.family_statuses.get_family_statuses')
local get_genders_use_case = require('use_cases.genders.get_genders')
local get_links_characs_magics_use_case = require('use_cases.link_characs_magics.get_link_characs_magics')
local post_links_characs_magics_use_case = require('use_cases.link_characs_magics.post_link_characs_magics')
local put_links_characs_magics_use_case = require('use_cases.link_characs_magics.put_link_characs_magics')
local delete_links_characs_magics_use_case = require('use_cases.link_characs_magics.delete_link_characs_magics')
local get_links_elems_magics_use_case = require('use_cases.link_elems_magics.get_link_elems_magics')
local post_links_elems_magics_use_case = require('use_cases.link_elems_magics.post_link_elems_magics')
local put_links_elems_magics_use_case = require('use_cases.link_elems_magics.put_link_elems_magics')
local delete_links_elems_magics_use_case = require('use_cases.link_elems_magics.delete_link_elems_magics')
local get_magics_use_case = require('use_cases.magics.get_magics')
local post_magics_use_case = require('use_cases.magics.post_magics')
local put_magics_use_case = require('use_cases.magics.put_magics')
local delete_magics_use_case = require('use_cases.magics.delete_magics')
local get_maps_use_case = require('use_cases.maps.get_maps')
local post_maps_use_case = require('use_cases.maps.post_maps')
local put_maps_use_case = require('use_cases.maps.put_maps')
local delete_maps_use_case = require('use_cases.maps.delete_maps')
-- nations
local get_nations_use_case = require('use_cases.nations.get_nations')
local post_nations_use_case = require('use_cases.nations.post_nations')
local put_nations_use_case = require('use_cases.nations.put_nations')
local delete_nations_use_case = require('use_cases.nations.delete_nations')
local get_nation_leaders_uses_case = require('use_cases.nation_leaders.get_nation_leaders')
local post_nation_leaders_uses_case = require('use_cases.nation_leaders.post_nation_leaders')
local put_nation_leaders_uses_case = require('use_cases.nation_leaders.put_nation_leaders')
local delete_nation_leaders_uses_case = require('use_cases.nation_leaders.delete_nation_leaders')
local get_sexes_use_case = require('use_cases.sexes.get_sexes')
routing.routes = {
    -- { "path", "http_method", function_to_call, "name", requires_authentication },
    { "/health", http.methods.GET, health_use_case.execute, "get_health", false },
    { "/calendars", http.methods.GET, get_calendars_use_case.execute, "get_calendars", false },
    { "/charac-events", http.methods.GET, get_charac_events_use_case.execute, "get_charac_events", false },
    { "/charac-events", http.methods.POST, post_charac_events_use_case.execute, "post_charac_events", true },
    { "/charac-events", http.methods.PUT, put_charac_events_use_case.execute, "put_charac_events", true },
    { "/charac-events", http.methods.DELETE, delete_charac_events_use_case.execute, "delete_charac_events", true },
    { "/characs", http.methods.GET, get_characs_use_case.execute, "get_characs", false },
    { "/characs", http.methods.POST, post_characs_use_case.execute, "post_characs", true },
    { "/characs", http.methods.PUT, put_characs_use_case.execute, "put_characs", true },
    { "/characs", http.methods.DELETE, delete_characs_use_case.execute, "delete_characs", true },
    { "/charac/%d+/portrait", http.methods.POST, post_charac_portrait.execute, "post_charac_portrait", true },
    { "/charac/%d+/portrait", http.methods.DELETE, delete_charac_portrait.execute, "delete_charac_portrait", true },
    { "/charac-relationships", http.methods.GET, get_charac_relationships_use_case.execute, "get_charac_relationships", false },
    { "/charac-relationships", http.methods.POST, post_charac_relationships_use_case.execute, "post_charac_relationships", true },
    { "/charac-relationships", http.methods.PUT, put_charac_relationships_use_case.execute, "put_charac_relationships", true },
    { "/charac-relationships", http.methods.DELETE, delete_charac_relationships_use_case.execute, "delete_charac_relationships", true },
    { "/classes", http.methods.GET, get_classes_use_case.execute, "get_classes", false },
    { "/elements", http.methods.GET, get_elems_use_case.execute, "get_elems", false },
    { "/family-statuses", http.methods.GET, get_family_statuses_use_case.execute, "get_family_statuses", false },
    { "/genders", http.methods.GET, get_genders_use_case.execute, "get_genders", false },
    { "/link-characs-magics", http.methods.GET, get_links_characs_magics_use_case.execute, "get_links_characs_magics", false },
    { "/link-characs-magics", http.methods.POST, post_links_characs_magics_use_case.execute, "post_links_characs_magics", true },
    { "/link-characs-magics", http.methods.PUT, put_links_characs_magics_use_case.execute, "put_links_characs_magics", true },
    { "/link-characs-magics", http.methods.DELETE, delete_links_characs_magics_use_case.execute, "delete_links_characs_magics", true },
    { "/link-elems-magics", http.methods.GET, get_links_elems_magics_use_case.execute, "get_links_elems_magics", false },
    { "/link-elems-magics", http.methods.POST, post_links_elems_magics_use_case.execute, "post_links_elems_magics", true },
    { "/link-elems-magics", http.methods.PUT, put_links_elems_magics_use_case.execute, "put_links_elems_magics", true },
    { "/link-elems-magics", http.methods.DELETE, delete_links_elems_magics_use_case.execute, "delete_links_elems_magics", true },
    { "/magics", http.methods.GET, get_magics_use_case.execute, "get_magics", false },
    { "/magics", http.methods.POST, post_magics_use_case.execute, "post_magics", true },
    { "/magics", http.methods.PUT, put_magics_use_case.execute, "put_magics", true },
    { "/magics", http.methods.DELETE, delete_magics_use_case.execute, "delete_magics", true },
    { "/maps", http.methods.GET, get_maps_use_case.execute, "get_maps", false },
    { "/maps", http.methods.POST, post_maps_use_case.execute, "post_maps", true },
    { "/maps", http.methods.PUT, put_maps_use_case.execute, "put_maps", true },
    { "/maps", http.methods.DELETE, delete_maps_use_case.execute, "delete_maps", true },
    { "/nations", http.methods.GET, get_nations_use_case.execute, "get_nations", false },
    { "/nations", http.methods.POST, post_nations_use_case.execute, "post_nations", true },
    { "/nations", http.methods.PUT, put_nations_use_case.execute, "put_nations", true },
    { "/nations", http.methods.DELETE, delete_nations_use_case.execute, "delete_nations", true },
    { "/nation-leaders", http.methods.GET, get_nation_leaders_uses_case.execute, "get_nation_leaders", false },
    { "/nation-leaders", http.methods.POST, post_nation_leaders_uses_case.execute, "post_nation_leaders", true },
    { "/nation-leaders", http.methods.PUT, put_nation_leaders_uses_case.execute, "put_nation_leaders", true },
    { "/nation-leaders", http.methods.DELETE, delete_nation_leaders_uses_case.execute, "delete_nation_leaders", true },
    { "/sexes", http.methods.GET, get_sexes_use_case.execute, "get_sexes", false }
}

function routing.dispatch(request, response)
    routing.prepareResponse(response)

    for _,value in pairs(routing.routes) do
        local route_matching = routing.check_route_match(request, value[1], value[2], value[5])

        if route_matching == route_match.MATCHING then
            logger.log(logger.levels.INFO, "Dispatching received request to endpoint " .. value[4] .. "...")
            value[3](request, response)
            return

        elseif route_matching == route_match.UNAUTHORISED then
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

---
--- Function that will check whether the request path corresponds to the given route.
---
--- @param request Request The request to check for route matching.
--- @param route_regex string The regular expression to identify the route currently checked.
--- @param route_method string The method of the route currently checked.
--- @param requires_authentication boolean Whether the route requires authentication.
---
--- @return number Refer to the route_match enum for more info.
---
function routing.check_route_match(request, route_regex, route_method, requires_authentication)
    if not string.match(request:path(), route_regex) == request:path() then return route_match.NO_MATCH end
    if not request:method() == route_method then return route_match.NO_MATCH end
    if not security.check_key(request, requires_authentication) then return route_match.UNAUTHORISED end

    return route_match.MATCHING
end

return routing
