# Manager updater configuration files

All configuration files are actual Lua scripts excluded from this directory (for safety reasons).
You will find below the list of configuration files to add, as well as examples with placeholder
values to show you how you should fill those files.

> **NOTE:**  
> Most of these scripts are actual enumeration equivalents. In fact, I made them scripts for convenience.
> The advantages of this method is that there is no file to parse, and the naming is right and directly
> more explicit.  
> On top of that, the format of the file doesn't really matter too much, as long as it is correct Lua.

## Database connection
Database connection information are stored in the script name `database.lua`. Here is an example of
what it should look like, and what information it should contain.

```lua
-- location: @root/config/database.lua

return {
    sourcename = "TheNameOfYourDatabase",
    username = "YourLogin",
    password = "YourPassword"
}
```