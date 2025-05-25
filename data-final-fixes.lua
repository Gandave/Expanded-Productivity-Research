require("functions")

-- hard coded blacklists
local blacklist_techs = {} -- none needed so far
local blacklist_item = {
	"jellynut-seed", "yumako-seed", -- so that the plant processing recipes show jelly/mash rather than seeds
	"ice",
	"uranium-238",
}
local blacklist_fluid = { "water", "steam" }
local blacklist_recipe = {
	"nuclear-fuel-reprocessing", -- leads to a single, silly productivity tech for U-238
}

-- hard code this for now
local prod_techs = { "asteroid-productivity", "processing-unit-productivity", "scrap-recycling-productivity", "steel-plate-productivity", "low-density-structure-productivity", "plastic-bar-productivity", "rocket-fuel-productivity", "rocket-part-productivity" }

local blacklist_product = table.deepcopy(blacklist_item)
for _, val in pairs(blacklist_fluid) do
	table.insert(blacklist_product, val)
end

EPR.generateAllProductivityTechs(blacklist_techs, blacklist_product, blacklist_recipe)
