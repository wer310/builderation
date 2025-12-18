--alphabet mod
--by OFG
-- v 0.1 (17_March_2023)


local alphabet_list = {
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
}

for _, i in ipairs(alphabet_list) do
	minetest.register_node("japanese_letters_alphabet:alphabet_"..i, {
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

local alphabet_list2 = {
	"t_b","t_c","t_d","t_e","t_f","t_g","t_h","t_i","t_j","t_k","t_l","t_m","t_n","t_o","t_p","t_q","t_r","t_s","t_t","t_u","t_v","t_w","t_x","t_y","t_z"
}

if minetest.get_modpath("i3") then
	i3.compress("japanese_letters_alphabet:alphabet_a", {
		replace = "t_a",
		by = alphabet_list2
	})
end
