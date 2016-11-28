All Lua files in the folder "sys/lua/autorun" will be executed automatically when starting a server!
This is a new feature of Counter-Strike 2D Beta 0.1.2.1

Execution order of Lua scripts is
- Server Lua file (default: "sys/lua/server.lua")
- All Lua files in "sys/lua/autorun" (in alphabetic order)
- Map Lua file (default: "maps/<NAME OF MAP>.lua")