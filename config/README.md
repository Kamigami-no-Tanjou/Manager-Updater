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
Database connection information are stored in the script named `database.lua`. Here is an example of
what it should look like, and what information it should contain.

```lua
-- location: @root/config/database.lua

return {
    sourcename = "TheNameOfYourDatabase",
    username = "YourLogin",
    password = "YourPassword"
}
```

## Key based authentication
In order to be allowed to perform data-changing actions, you need to be authenticated. As this API
doesn't have users, a simple API key is set, and configured in the `api_key.lua` configuration file.
Here is how it is supposed to look like:

```lua
-- location: @root/config/api_key.lua

return "YOUR_API_SECRET_KEY"
```

You can set whatever you want here, and there is no encryption nor decryption process, so the key is
checked as plain text. Therefore, checking whether the user is allowed to perform an action is blazing
fast, but I'd advise you to set a **very** strong key. That is, a key automatically generated, that
includes small and capital letters, numbers and special characters as well, and is at the very least
64 characters long.

> **NOTE:**  
> In a user based authentication, as you cannot really force your users to use fully secure and
> unpredictable passwords, encryption with salt and pepper is mandatory in order to keep systems
> secure. But in our case, we only have one password, and we know it is secure, so there is no real
> need for any encryption process.

## Access control
If you want/need your API to be called from another server, you might want to edit the access control
parameters, that will be sent with the generic options response. To do that, create a file named
`access_control.lua` at the root of the `config` directory, and give the follwing informations:

```lua
-- location: @root/config/access_control.lua

return {
    allow_origin = "*YOUR ALLOWED ORIGINS ('*' only is not advised)",
    allow_methods = "GET, POST, PUT, DELETE, OPTIONS, ...",
    allow_headers = "Your, Headers-To, Allow"
}
```

> **NOTE:**  
> None of the aforementioned parameters are mandatory, so you can chose to remove some of the values
> displayed in the example. The presence of this file is mandatory though, as it is required in a 
> use case, which would make the program crash if not having it.
