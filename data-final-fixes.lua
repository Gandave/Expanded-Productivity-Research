require("functions")

-- hard coded blacklists
local blacklist_techs = {} -- none needed so far
local blacklist_item = {
	"jellynut-seed", "yumako-seed", -- so that the plant processing recipes show jelly/mash rather than seeds
	-- "ice",
	-- "uranium-238",
	-- "offshore-pump", "pump",
	"cargo-landing-pad", -- are you really going to need productivity on that?
	"arithmetic-combinator", "decider-combinator", "constant-combinator", "power-switch", "programmable-speaker", "display-panel", "selector-combinator"
}
local blacklist_fluid = { "water", "steam" } -- silly stuff like infinite water/steam
local blacklist_recipe = {
	"nuclear-fuel-reprocessing", -- leads to a single, silly productivity tech for U-238
	"carbonic-asteroid-reprocessing", "metallic-asteroid-reprocessing", "oxide-asteroid-reprocessing", "vgal-promethium-asteroid-chunk-reprocessing"
}

-- hard code this for now
local prod_techs = { "asteroid-productivity", "processing-unit-productivity", "scrap-recycling-productivity", "steel-plate-productivity", "low-density-structure-productivity", "plastic-bar-productivity", "rocket-fuel-productivity", "rocket-part-productivity" }

local blacklist_product = table.deepcopy(blacklist_item)
for _, val in pairs(blacklist_fluid) do
	table.insert(blacklist_product, val)
end

if mods["SpaceAgeWithoutSpace"] then
	table.insert(blacklist_product, "promethium-science-pack")
end

if settings.startup[EPR.prefix("overwrite_blacklist")].value then
	blacklist_product = {}
	blacklist_recipe = {}
	for str in string.gmatch(settings.startup[EPR.prefix("blacklist_item")].value, ",") do
		table.insert(blacklist_product, str)
	end
	for str in string.gmatch(settings.startup[EPR.prefix("blacklist_recipe")].value, ",") do
		table.insert(blacklist_recipe, str)
	end
end

EPR.generateAllProductivityTechs(blacklist_techs, blacklist_product, blacklist_recipe)
