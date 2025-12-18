local modname = minetest.get_current_modname()
local ci = {}
ci.blocks = {}      -- complete list of node names
ci.pages = {}       -- current page per player
ci.selected_item = {} -- store selected item per player
local columns = 15
local rows = 7
local nodes_per_page = columns * rows  -- 105 nodes per page

minetest.register_privilege("ci", {
    description = "Allows the player to use the ci command",
    give_to_singleplayer = false
})

local function has_permission(player_name)
    return minetest.check_player_privs(player_name, {ci=true})
end

-- Build the list of nodes after all mods are loaded.
minetest.register_on_mods_loaded(function()
    local list_items = minetest.settings:get_bool("ci_list_items")
    local list_tools = minetest.settings:get_bool("ci_list_tools")
    for name, def in pairs(minetest.registered_items) do
        if def.type == "node" or (list_items and def.type == "craftitem") or (list_tools and def.type == "tool") then
            table.insert(ci.blocks, name)
        end
    end
    table.sort(ci.blocks)
end)

function ci.get_total_pages()
    return math.ceil(#ci.blocks / nodes_per_page)
end

function ci.get_formspec(player)
    local player_name = player:get_player_name()
    local current_page = ci.pages[player_name] or 1
    local total_pages = ci.get_total_pages()

    local formspec = "size[17.5,10.5]" ..
        "label[0.5,0.2;Select a block to add to your inventory:]" ..
        "field[4,9.1;2,1;quantity;Amount:;1]" ..
        "label[8.5,9;Page " .. current_page .. " of " .. total_pages .. "]"

    local start_index = (current_page - 1) * nodes_per_page + 1
    local end_index = math.min(current_page * nodes_per_page, #ci.blocks)

    -- Place the block buttons in a grid.
    for i = start_index, end_index do
        local block = ci.blocks[i]
        local rel = i - start_index  -- relative index on this page
        local col = rel % columns
        local row = math.floor(rel / columns)
        local x = 0.5 + col * 1.1
        local y = 1 + row * 1.1
        formspec = formspec ..
            string.format("item_image_button[%f,%f;1,1;%s;add_%s;]",
                x, y,
                minetest.formspec_escape(block),
                minetest.formspec_escape(block))
    end

    if current_page > 1 then
        formspec = formspec .. "button[6.25,9;2,0.5;prev;Previous]"
    end
    if current_page < total_pages then
        formspec = formspec .. "button[10.25,9;2,0.5;next;Next]"
    end
    formspec = formspec .. "button_exit[8.25,9.75;2,0.5;exit;Close]"
    return formspec
end

minetest.register_chatcommand("ci", {
    description = "Open block list GUI with pages",
    privs = {ci=true},
    func = function(name, param)
        if not has_permission(name) then
            return false, "You do not have permission to use this command."
        end

        ci.pages[name] = 1
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found."
        end
        local formspec = ci.get_formspec(player)
        minetest.show_formspec(name, modname .. ":form", formspec)
        return true, "Opening block list..."
    end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= modname .. ":form" then
        return
    end
    local player_name = player:get_player_name()
        if not has_permission(player_name) then
        minetest.chat_send_player(player_name, "You do not have permission to use this.")
        return
    end

    if fields.next then
        local total_pages = ci.get_total_pages()
        local current_page = ci.pages[player_name] or 1
        if current_page < total_pages then
            ci.pages[player_name] = current_page + 1
        end
        minetest.show_formspec(player_name, modname .. ":form", ci.get_formspec(player))
        return true
    elseif fields.prev then
        local current_page = ci.pages[player_name] or 1
        if current_page > 1 then
            ci.pages[player_name] = current_page - 1
        end
        minetest.show_formspec(player_name, modname .. ":form", ci.get_formspec(player))
        return true
    end

    -- If a block button was pressed, add that block in specified quantity.
    local quantity = tonumber(fields.quantity) or 1
    if quantity < 1 then quantity = 1 end
    for field, _ in pairs(fields) do
        if field:sub(1, 4) == "add_" then
            local blockname = field:sub(5)
            local inv = player:get_inventory()
            if inv then
                inv:add_item("main", blockname .. " " .. quantity)
                minetest.chat_send_player(player_name, "Added " .. quantity .. " of: " .. blockname)
            end
            return true
        end
    end
end)
