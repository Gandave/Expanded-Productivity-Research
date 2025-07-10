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
		type = "int-setting",
		name = "epr_formula_minimum",
		setting_type = "startup",
		default_value = 50,
		order = "a[regular]a[formula]c"
	},
	{
		type = "string-setting",
		name = "epr_finite_tech_scaling",
		setting_type = "startup",
		default_value = "exponential_halved",
		order = "a[regular]b[scaling]a",
		allowed_values = { "exponential", "exponential_halved", "linear", "linear_halved", "custom" }
	},
	{
		type = "string-setting",
		name = "epr_finite_tech_scaling_custom",
		setting_type = "startup",
		default_value = "",
		allow_blank = true,
		order = "a[regular]b[scaling]b"
	},
	{
		type = "int-setting",
		name = "epr_levels_per_tier",
		setting_type = "startup",
		default_value = 1,
		order = "a[regular]ab[tier]a"
	},
	{
		type = "int-setting",
		name = "epr_productivity_per_level",
		setting_type = "startup",
		default_value = 10,
		order = "a[regular]ac[effect]a"
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
		type = "int-setting",
		name = "epr_formula_minimum_science",
		setting_type = "startup",
		default_value = 50,
		order = "b[science]a[formula]c"
	},
	{
		type = "string-setting",
		name = "epr_finite_tech_scaling_science",
		setting_type = "startup",
		default_value = "exponential_halved",
		order = "b[science]b[scaling]a",
		allowed_values = { "linear", "linear_halved", "exponential", "exponential_halved", "custom" }
	},
	{
		type = "string-setting",
		name = "epr_finite_tech_scaling_custom_science",
		setting_type = "startup",
		default_value = "",
		allow_blank = true,
		order = "b[science]b[scaling]b"
	},
	{
		type = "int-setting",
		name = "epr_levels_per_tier_science",
		setting_type = "startup",
		default_value = 1,
		order = "b[science]ab[tier]a"
	},
	{
		type = "int-setting",
		name = "epr_productivity_per_level_science",
		setting_type = "startup",
		default_value = 10,
		order = "b[science]ac[effect]a"
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
		type = "bool-setting",
		name = "epr_adjust_existing_techs",
		setting_type = "startup",
		default_value = true,
		order = "c[adjust]a"
	},
	{
		type = "string-setting",
		name = "epr_choose_recipes",
		setting_type = "startup",
		default_value = "intermediate",
		order = "d[further]a[recipes]a",
		allowed_values = { "none", "intermediate", "intermediate_tiles", "intermediate_ammo", "intermediate_modules", "intermediate_tiles_ammo", "intermediate_tiles_modules", "intermediates_tiles_ammo_modules", "intermediate_ammo_modules", "all_but_equipment", "all" }
	},
	{
		type = "bool-setting",
		name = "epr_remember_intermediate",
		setting_type = "startup",
		default_value = false,
		order = "d[further]a[recipes]ab"
	},
	{
		type = "bool-setting",
		name = "epr_include_recycling_recipes",
		setting_type = "startup",
		default_value = false,
		order = "d[further]a[recipes]b[options]b"
	},
	{
		type = "bool-setting",
		name = "epr_include_infinite_recipes",
		setting_type = "startup",
		default_value = false,
		order = "d[further]a[recipes]b[options]c"
	},
	{
		type = "bool-setting",
		name = "epr_include_hidden_recipes",
		setting_type = "startup",
		default_value = false,
		order = "d[further]a[recipes]b[options]d"
	},
	{
		type = "string-setting",
		name = "epr_blacklist_item",
		setting_type = "startup",
		allow_blank = true,
		default_value = "jellynut-seed,yumako-seed,cargo-landing-pad,arithmetic-combinator,decider-combinator,constant-combinator,power-switch,programmable-speaker,display-panel,selector-combinator,water,steam",
		order = "d[further]m[blacklist]b"
	},
	{
		type = "string-setting",
		name = "epr_blacklist_recipe",
		setting_type = "startup",
		allow_blank = true,
		default_value = "nuclear-fuel-reprocessing,carbonic-asteroid-reprocessing,metallic-asteroid-reprocessing,oxide-asteroid-reprocessing,vgal-promethium-asteroid-chunk-reprocessing",
		order = "d[further]m[blacklist]c"
	},
	{
		type = "string-setting",
		name = "epr_whitelist_item",
		setting_type = "startup",
		allow_blank = true,
		default_value = "",
		order = "d[further]n[whitelist]a"
	},
	{
		type = "string-setting",
		name = "epr_whitelist_recipe",
		setting_type = "startup",
		allow_blank = true,
		default_value = "",
		order = "d[further]n[whitelist]b"
	},
	{
		type = "bool-setting",
		name = "epr_verbose",
		setting_type = "startup",
		default_value = false,
		order = "e[debug]a"
	}
})
