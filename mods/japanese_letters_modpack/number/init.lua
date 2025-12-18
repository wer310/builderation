--number mod
--by OFG
-- v 0.1 (17_March_2023)


local number_list = {
	"1","2","3","4","5","6","7","8","9","0"
}

for _, i in ipairs(number_list) do
	minetest.register_node("japanese_letters_number:number_"..i, {
		tiles = {i..".png"},
		inventory_image = i..".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = true,
		climbable = false,
		diggable = true,
		drawtype = "nodebox",
		groups = { choppy = 3, oddly_breakable_by_hand = 1},
		--material = minetest.digprop_constanttime(1.0),
		description = i
	})
end

table.remove(number_list, 1)

if minetest.get_modpath("i3") then
	i3.compress("japanese_letters_number:number_1", {
		replace = "1",
		by = number_list
	})
end
