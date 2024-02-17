---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by RedNeath.
--- DateTime: 16/02/2024 17:44
---
local logger = {
    levels = {
        TRACE = { grade = 0, tag = "[TRACE]" },
        DEBUG = { grade =  1, tag = "[DEBUG]" },
        INFO = { grade = 2, tag = "[INFO ]" },
        WARN = { grade = 3, tag = "[WARN ]" },
        ERROR = { grade = 4, tag = "[ERROR] " },
        FATAL = { grade = 5, tag = "[FATAL]" }
    }
}

---
--- Will write a log of the given level into a stream.
---
--- Warning: this is not yet environment dependent!
---
function logger.log(level, message)
    print(level.tag .. " " .. os.date("%c") .. " => " .. message)
end

return logger
