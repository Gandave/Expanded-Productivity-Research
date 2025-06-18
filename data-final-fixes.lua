require("functions")

local blacklist_item
local blacklist_recipe
local whitelist_item
local whitelist_recipe

if settings.startup[EPR.prefix("blacklist_item")] then
	blacklist_item = {}
	for str in string.gmatch(settings.startup[EPR.prefix("blacklist_item")].value, "[^,]+") do
		table.insert(blacklist_item, str)
	end
end

if mods["SpaceAgeWithoutSpace"] then
	table.insert(blacklist_product, "promethium-science-pack")
end

if settings.startup[EPR.prefix("blacklist_recipe")] then
	blacklist_recipe = {}
	for str in string.gmatch(settings.startup[EPR.prefix("blacklist_recipe")].value, "[^,]+") do
		table.insert(blacklist_recipe, str)
	end
end

if settings.startup[EPR.prefix("whitelist_item")] then
	whitelist_item = {}
	for str in string.gmatch(settings.startup[EPR.prefix("whitelist_item")].value, "[^,]+") do
		table.insert(whitelist_item, str)
	end
end

if settings.startup[EPR.prefix("whitelist_recipe")] then
	whitelist_recipe = {}
	for str in string.gmatch(settings.startup[EPR.prefix("whitelist_recipe")].value, "[^,]+") do
		table.insert(whitelist_recipe, str)
	end
end

EPR.generateAllProductivityTechs(nil, blacklist_item, blacklist_recipe, whitelist_item, whitelist_recipe)
