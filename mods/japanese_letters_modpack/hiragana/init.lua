--Japanese Hiragana mod
--by OFG
-- v 0.1 (17_March_2023)


local hiragana_list = {
	"01_a","02_i","03_u","04_e","05_o","06_ka","07_ki","08_ku","09_ke","10_ko","11_ga","12_gi","13_gu","14_ge","15_go","16_sa","17_si","18_su","19_se","20_so","21_za","22_ji","23_zu","24_ze","25_zo","26_ta","27_chi","28_tsu","29_te","30_to","31_da","32_di","33_du","34_de","35_do","36_na","37_ni","38_nu","39_ne","40_no","41_ha","42_hi","43_fu","44_he","45_ho","46_ba","47_bi","48_bu","49_be","50_bo","51_pa","52_pi","53_pu","54_pu","55_po","56_ma","67_mi","68_mu","69_me","70_mo","71_ya","73_yu","75_yo","76_ra","77_ri","78_ru","79_re","80_ro","81_wa","83_wo","85_nn","86_xa","87_xi","88_xu","89_xe","90_xo","91_xtsu","92_xya","93_xyu","94_xyo","95___","96_exclamation","97_question"
}

for _, i in ipairs(hiragana_list) do
	minetest.register_node("japanese_letters_hiragana:hiragana"..i, {
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

table.remove(hiragana_list, 1)

if minetest.get_modpath("i3") then
	i3.compress("japanese_letters_hiragana:hiragana01_a", {
		replace = "01_a",
		by = hiragana_list
	})
end
