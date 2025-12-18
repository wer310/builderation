local whatsoundtouse_stone = {}
local whatsoundtouse_wood = {}
local whatsoundtouse_glass = {}

if minetest.get_modpath("default") or minetest.get_modpath("default_sounds_for_other_games") then
	whatsoundtouse_wood = default.node_sound_wood_defaults()
	whatsoundtouse_stone = default.node_sound_stone_defaults()
	whatsoundtouse_glass = default.node_sound_glass_defaults()
else
	if minetest.get_modpath("xcompat") then
		local sound_api = xcompat.sounds
		whatsoundtouse_wood = sound_api.node_sound_wood_defaults()
		whatsoundtouse_stone = sound_api.node_sound_stone_defaults()
		whatsoundtouse_glass = sound_api.node_sound_glass_defaults()
	end
end

minetest.register_node("awuuwa_building_blocks:glass_wall", {
	description = "Glass Wall",
	drawtype = "nodebox",
	tiles = {"default_glass.png"},
	wield_image = "default_glass.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = true,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.5, 0.375, -0.5, 0.5, 0.5, 0.5},
		wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		wall_side   = {-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}
	},
	selection_box = {type = "wallmounted"},
	groups = {snappy = 3, choppy = 3, deco_block = 1},
	sounds = whatsoundtouse_glass
})

minetest.register_node("awuuwa_building_blocks:black_bricks", {
	description = "Black Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_black_bricks.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:small_stone_bricks", {
	description = "Small Stone Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_small_stone_bricks.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:mossy_small_stone_bricks", {
	description = "Mossy Small Stone Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_mossy_small_stone_bricks.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:neat_tiles", {
	description = "Neat Tiles",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_neat_tiles.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:white_bricks_1", {
	description = "White Bricks 1",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_white_bricks_1.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:white_bricks_2", {
	description = "White Bricks 2",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_white_bricks_2.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:yellow_bricks_1", {
	description = "Yellow Bricks 1",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_yellow_bricks_1.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:yellow_bricks_2", {
	description = "Yellow Bricks 2",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_yellow_bricks_2.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:brown_bricks", {
	description = "Brown Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_brown_bricks.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:gray_bricks", {
	description = "Gray Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_gray_bricks.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:orange_bricks", {
	description = "Orange Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_orange_bricks.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:nice_bricks", {
	description = "Varying Bricks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {{name="awuuwa_building_blocks_nice_bricks.png", align_style='world', scale=6}},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_stone
})

minetest.register_node("awuuwa_building_blocks:yellow_wooden_panels", {
	description = "Yellow Wooden Panels",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_yellow_wooden_panels.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1, building_block = 1},
	sounds = whatsoundtouse_wood
})

minetest.register_node("awuuwa_building_blocks:black_wooden_panels", {
	description = "Black Wooden Panels",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_black_wooden_panel_1.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1, building_block = 1},
	sounds = whatsoundtouse_wood
})

minetest.register_node("awuuwa_building_blocks:white_wooden_thing_1", {
	description = "White Wooden Thing",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_white_wooden_thing_1.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1, building_block = 1},
	sounds = whatsoundtouse_wood
})

minetest.register_node("awuuwa_building_blocks:weird_grid", {
	description = "Weird Grid",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_weird_grid.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_wood
})

minetest.register_node("awuuwa_building_blocks:klinkers_1", {
	description = "klinkers 1",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_klinkers_1.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_wood
})

minetest.register_node("awuuwa_building_blocks:klinkers_2", {
	description = "klinkers 2",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"awuuwa_building_blocks_klinkers_2.png"},
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, building_block = 1},
	sounds = whatsoundtouse_wood
})



--[[minetest.register_node("awuuwa_building_blocks:oak_tree", {
	description = "Oak Tree",
	tiles = {"awuuwa_building_blocks_tree_top.png", "awuuwa_building_blocks_tree_top.png",
		"awuuwa_building_blocks_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})]]

--[[minetest.register_craft({
	output = "awuuwa_building_blocks:oak_planks 4",
	recipe = {
		{"awuuwa_building_blocks:oak_tree"},
	}
})]]

--[[minetest.register_node("awuuwa_building_blocks:oak_leaves", {
	description = "Oak Tree Leaves",
	drawtype = "allfaces_optional",
	tiles = {"awuuwa_building_blocks_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})]]
