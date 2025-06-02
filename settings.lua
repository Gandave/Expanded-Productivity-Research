local science_packs = {
	"automation-science",
	"logistic-science",
	"military-science",
	"chemical-science",
	"production-science",
	"utility-science",
	"space-science"
}

local default_max = "space-science"
local default_max_science = "space-science"
local default_skip_utility = false

if mods["space-age"] then
	table.insert(science_packs, "one-planetary-science")
	table.insert(science_packs, "any-planetary-science")
	table.insert(science_packs, "all-planetary-science")
	table.insert(science_packs, "promethium-science")
	default_max = "one-planetary-science"
	default_max_science = "promethium-science"
	default_skip_utility = true
end

data:extend({
	{
		type = "double-setting",
		name = "epr_formula_factor",
		setting_type = "startup",
		default_value = 1.5,
		order = "a[regular]a[formula]a"
	},
	{
		type = "double-setting",
		name = "epr_formula_base",
		setting_type = "startup",
		default_value = 1000,
		order = "a[regular]a[formula]b"
	},
	{
		type = "bool-setting",
		name = "epr_infinite_tech",
		setting_type = "startup",
		default_value = true,
		order = "a[regular]b[level]a"
	},
	{
		type = "int-setting",
		name = "epr_max_level_value",
		setting_type = "startup",
		default_value = 30,
		order = "a[regular]b[level]b"
	},
	{
		type = "string-setting",
		name = "epr_minimum_science_pack",
		setting_type = "startup",
		default_value = "logistic-science",
		order = "a[regular]c[packs]a",
		allowed_values = science_packs
	},
	{
		type = "string-setting",
		name = "epr_maximum_science_pack",
		setting_type = "startup",
		default_value = default_max,
		order = "a[regular]c[packs]b",
		allowed_values = science_packs
	},
	{
		type = "bool-setting",
		name = "epr_skip_military",
		setting_type = "startup",
		default_value = true,
		order = "a[regular]c[packs]c"
	},
	{
		type = "bool-setting",
		name = "epr_skip_utility",
		setting_type = "startup",
		default_value = default_skip_utility,
		order = "a[regular]c[packs]d"
	},
	{
		type = "double-setting",
		name = "epr_formula_factor_science",
		setting_type = "startup",
		default_value = 1.5,
		order = "b[science]a[formula]a"
	},
	{
		type = "double-setting",
		name = "epr_formula_base_science",
		setting_type = "startup",
		default_value = 1000,
		order = "b[science]a[formula]b"
	},
	{
		type = "bool-setting",
		name = "epr_infinite_tech_science",
		setting_type = "startup",
		default_value = true,
		order = "b[science]b[level]a"
	},
	{
		type = "int-setting",
		name = "epr_max_level_value_science",
		setting_type = "startup",
		default_value = 30,
		order = "b[science]b[level]b"
	},
	{
		type = "string-setting",
		name = "epr_minimum_science_pack_science",
		setting_type = "startup",
		default_value = "logistic-science",
		order = "b[science]c[packs]a",
		allowed_values = science_packs
	},
	{
		type = "string-setting",
		name = "epr_maximum_science_pack_science",
		setting_type = "startup",
		default_value = default_max_science,
		order = "b[science]c[packs]b",
		allowed_values = science_packs
	},
	{
		type = "bool-setting",
		name = "epr_skip_military_science",
		setting_type = "startup",
		default_value = true,
		order = "b[science]c[packs]c"
	},
	{
		type = "bool-setting",
		name = "epr_skip_utility_science",
		setting_type = "startup",
		default_value = false,
		order = "b[science]c[packs]d"
	},
	{
		type = "string-setting",
		name = "epr_choose_recipes",
		setting_type = "startup",
		default_value = "intermediate",
		order = "d[further]a[recipes]",
		allowed_values = { "intermediate", "intermediate_tiles", "intermediate_ammo", "intermediate_modules", "intermediate_tiles_ammo", "intermediate_tiles_modules", "intermediates_tiles_ammo_modules", "intermediate_ammo_modules", "all_but_equipment", "all" }
	},
	{
		type = "bool-setting",
		name = "epr_overwrite_blacklist",
		setting_type = "startup",
		default_value = false,
		order = "d[further]m[blacklist]a"
	},
	{
		type = "string-setting",
		name = "epr_blacklist_item",
		setting_type = "startup",
		allow_blank = true,
		default_value = "",
		order = "d[further]m[blacklist]b"
	},
	{
		type = "string-setting",
		name = "epr_blacklist_recipe",
		setting_type = "startup",
		allow_blank = true,
		default_value = "",
		order = "d[further]m[blacklist]c"
	},
	{
		type = "bool-setting",
		name = "epr_verbose",
		setting_type = "startup",
		default_value = false,
		order = "e[debug]a"
	}
})

if mods["space-age"] then
	data:extend({
		{
			type = "bool-setting",
			name = "epr_adjust_existing_techs",
			setting_type = "startup",
			default_value = true,
			order = "c[space-age]a"
		}
	})
end
