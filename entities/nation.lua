---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 16/02/2024 23:20
---
local types_default = require('utils.types_default')

nation = {}

function nation:new(mapped_fields)
    mapped_fields = mapped_fields or {}
    local instance = {}

    instance.id = mapped_fields.id or mapped_fields[1] or types_default.number
    instance.name = mapped_fields.name or mapped_fields[2] or types_default.string
    instance.calendar = mapped_fields.calendar or mapped_fields[3] or types_default.number
    instance.foundation_date = mapped_fields.foundation_date or mapped_fields[4] or types_default.string
    instance.destruction_date = mapped_fields.destruction_date or mapped_fields[5] or nil
    instance.description = mapped_fields.description or mapped_fields[6] or types_default.string

    return setmetatable(instance, self)
end

return nation