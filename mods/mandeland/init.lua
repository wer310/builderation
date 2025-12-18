
-- forces the map into singlenode mode
luamap.set_singlenode()


-- we will keep biome generation in the main thread for now since biomegen does not yet support the async thread.
local old_postcalc = luamap.postcalc

-- generate biomes with biomegen
function luamap.postcalc(data, area, vm, minp, maxp, seed)
    old_postcalc(data, area, vm, minp, maxp, seed)
    biomegen.generate_all(data, area, vm, minp, maxp, seed)
end

local use_async = core.settings:get_bool("mandeland_use_async",true) and core.settings:get_bool("luamap_use_async", true)

if use_async == true then
    core.register_mapgen_script(core.get_modpath("mandeland").."/mapgen.lua")
else
    dofile(core.get_modpath("mandeland").."/common.lua")
end