---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 18/02/2024 17:19
---
local data_checker = {}

function data_checker.ensure_model_compliance(entity, model, extra_function)
    data_checker.ensure_nullable_compliance(entity, model, extra_function, nil)
end

function data_checker.ensure_update_model_compliance(entity, model, extra_function)
    data_checker.ensure_nullable_compliance(entity, model, extra_function, '%NULL%')
end

function data_checker.ensure_nullable_compliance(entity, generic_model, extra_function, nil_value)
    for key, property in pairs(generic_model) do
        if not property.nullable and entity[key] == nil_value then error("nil value found!") end
        entity[key] = extra_function(entity[key])
    end
end

return data_checker