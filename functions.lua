EPR = {}

function EPR.prefix(name)
    return "epr_" .. name
end

EPR.setting = {
	["formula_factor"] = {
		["item"] = settings.startup[EPR.prefix("formula_factor")].value,
		["science_pack"] = settings.startup[EPR.prefix("formula_factor_science")].value
	},
	["formula_base"] = {
		["item"] = settings.startup[EPR.prefix("formula_base")].value,
		["science_pack"] = settings.startup[EPR.prefix("formula_base_science")].value
	},
	["infinite_tech"] = {
		["item"] = settings.startup[EPR.prefix("infinite_tech")].value,
		["science_pack"] = settings.startup[EPR.prefix("infinite_tech_science")].value
	},
	["max_level_value"] = {
		["item"] = settings.startup[EPR.prefix("max_level_value")].value,
		["science_pack"] = settings.startup[EPR.prefix("max_level_value_science")].value
	},
	["minimum_science_pack"] = {
		["item"] = settings.startup[EPR.prefix("minimum_science_pack")].value,
		["science_pack"] = settings.startup[EPR.prefix("minimum_science_pack_science")].value
	},
	["maximum_science_pack"] = {
		["item"] = settings.startup[EPR.prefix("maximum_science_pack")].value,
		["science_pack"] = settings.startup[EPR.prefix("maximum_science_pack_science")].value
	},
	["skip_military"] = {
		["item"] = settings.startup[EPR.prefix("skip_military")].value,
		["science_pack"] = settings.startup[EPR.prefix("skip_military_science")].value
	},
	["skip_utility"] = {
		["item"] = settings.startup[EPR.prefix("skip_utility")].value,
		["science_pack"] = settings.startup[EPR.prefix("skip_utility_science")].value
	},
	["adjust_existing_techs"] = settings.startup[EPR.prefix("adjust_existing_techs")] and settings.startup[EPR.prefix("adjust_existing_techs")].value or false,
	["choose_recipes"] = settings.startup[EPR.prefix("choose_recipes")].value,
	["verbose"] = settings.startup[EPR.prefix("verbose")].value
}

EPR.convertRecipeCategoryToAdvancedSciencePack = {
	["advanced-centrifuging"] = nil,
	["advanced-centrifuging-or-crafting"] = nil,
	["advanced-centrifuging-or-crafting-with-fluid"] = nil,
	["advanced-crafting"] = "metallurgic-science-pack",
	["advanced-metallurgy"] = "metallurgic-science-pack",
	["ammunition"] = "metallurgic-science-pack",
	["biochemistry"] = "agricultural-science-pack",
	["biochemistry-or-organic"] = "agricultural-science-pack",
	["biochemistry-or-organic-or-assembling"] = "agricultural-science-pack",
	["biochemistry-or-organic-or-hand-crafting"] = "agricultural-science-pack",
	["captive-spawner-process"] = "agricultural-science-pack",
	["centrifuging"] = nil,
	["chemistry"] = "cryogenic-science-pack",
	["chemistry-or-cryogenics"] = "cryogenic-science-pack",
	["core-mining"] = "metallurgic-science-pack",
	["crafting"] = nil,
	["crafting-with-fluid"] = nil,
	["crafting-with-fluid-or-metallurgy"] = "metallurgic-science-pack",
	["crushing"] = "metallurgic-science-pack",
	["cryogenics"] = "cryogenic-science-pack",
	["cryogenics-or-assembling"] = "cryogenic-science-pack",
	["electromagnetics"] = "electromagnetic-science-pack",
	["electronics"] = "electromagnetic-science-pack",
	["electronics-or-assembling"] = "electromagnetic-science-pack",
	["electronics-with-fluid"] = "electromagnetic-science-pack",
	["hydraulics"] = "cryogenic-science-pack",
	["hydraulics-or-chemistry"] = "cryogenic-science-pack",
	["hydraulics-or-chemistry-or-cryogenics"] = "cryogenic-science-pack",
	["hydraulics-or-organic"] = "agricultural-science-pack",
	["metallurgy"] = "metallurgic-science-pack",
	["metallurgy-or-assembling"] = "metallurgic-science-pack",
	["metallurgy-or-cryogenics"] = "metallurgic-science-pack",
	["oil-processing"] = "agricultural-science-pack",
	["organic"] = "agricultural-science-pack",
	["organic-or-assembling"] = "agricultural-science-pack",
	["organic-or-chemistry"] = "agricultural-science-pack",
	["organic-or-hand-crafting"] = "agricultural-science-pack",
	["petrochemistry"] = "cryogenic-science-pack",
	["petrochemistry-or-chemistry"] = "agricultural-science-pack",
	["petrochemistry-or-chemistry-or-cryogenics"] = "cryogenic-science-pack",
	["petrochemistry-or-organic-or-assembling"] = "agricultural-science-pack",
	["petrochemistry-or-organic-or-chemistry"] = "agricultural-science-pack",
	["pressing"] = "metallurgic-science-pack",
	["quantum-assembling-or-crafting"] = nil,
	["quantum-assembling-or-crafting-with-fluid"] = nil,
	["recycling"] = "electromagnetic-science-pack",
	["recycling-or-hand-crafting"] = "electromagnetic-science-pack",
	["rocket-building"] = "cryogenic-science-pack",
	["smelting"] = "metallurgic-science-pack",
	["synthesis"] = "cryogenic-science-pack",
	["synthesis-or-chemistry"] = "cryogenic-science-pack",
	["synthesis-or-crafting-with-fluid"] = "cryogenic-science-pack",
	["synthesis-or-cryogenics-or-chemistry"] = "cryogenic-science-pack",
	["woodworking"] = "agricultural-science-pack",
	["woodworking-or-organic"] = "agricultural-science-pack",
	["woodworking-or-organic-or-assembling"] = "agricultural-science-pack",
	["muluna-greenhouse"] = "agricultural-science-pack",
}

EPR.constItemCategories = {
	"item", "fluid", "tool", "armor", "repair-tool", "ammo", "capsule", "gun", "item-with-entity-data", "module", "space-platform-starter-pack", "rail-planner"
}

EPR.constSciencePacks = {
	["automation-science"] = { ["automation-science-pack"] = true },
	["logistic-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true },
	["military-science "] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true },
	["chemical-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true },
	["production-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true, ["production-science-pack"] = true },
	["utility-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true, ["production-science-pack"] = true, ["utility-science-pack"] = true },
	["space-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true, ["production-science-pack"] = true, ["utility-science-pack"] = true, ["space-science-pack"] = true },
	["one-planetary-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true, ["production-science-pack"] = true, ["utility-science-pack"] = true, ["space-science-pack"] = true },
	["any-planetary-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true, ["production-science-pack"] = true, ["utility-science-pack"] = true, ["space-science-pack"] = true },
	["all-planetary-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true, ["production-science-pack"] = true, ["utility-science-pack"] = true, ["space-science-pack"] = true, ["metallurgic-science-pack"] = true, ["electromagnetic-science-pack"] = true, ["agricultural-science-pack"] = true, ["cryogenic-science-pack"] = true },
	["promethium-science"] = { ["automation-science-pack"] = true, ["logistic-science-pack"] = true, ["military-science-pack"] = true, ["chemical-science-pack"] = true, ["production-science-pack"] = true, ["utility-science-pack"] = true, ["space-science-pack"] = true, ["metallurgic-science-pack"] = true, ["electromagnetic-science-pack"] = true, ["agricultural-science-pack"] = true, ["cryogenic-science-pack"] = true, ["promethium-science-pack"] = true }
}

EPR.constHighestSciencePacks = {
	["automation-science"] = "automation-science-pack",
	["logistic-science"] = "logistic-science-pack",
	["military-science "] = "military-science-pack",
	["chemical-science"] = "chemical-science-pack",
	["production-science"] = "production-science-pack",
	["utility-science"] = "utility-science-pack",
	["space-science"] = "space-science-pack",
	["one-planetary-science"] = nil,
	["any-planetary-science"] = nil,
	["all-planetary-science"] = { ["metallurgic-science-pack"] = true, ["electromagnetic-science-pack"] = true, ["agricultural-science-pack"] = true, ["cryogenic-science-pack"] = true },
	["promethium-science"] = "promethium-science-pack"
}

EPR.getTechLevelFromSciencePack = {
	["automation-science-pack"] = 1,
	["logistic-science-pack"] = 2,
	["military-science-pack"] = 3,
	["chemical-science-pack"] = 4,
	["production-science-pack"] = 5,
	["utility-science-pack"] = 6,
	["space-science-pack"] = 7,
	["metallurgic-science-pack"] = 8,
	["electromagnetic-science-pack"] = 8,
	["agricultural-science-pack"] = 8,
	["cryogenic-science-pack"] = 8,
	["promethium-science-pack"] = 9
}

if mods["SpaceAgeWithoutSpace"] then
	log("# EPR loading with SpaceAgeWithoutSpace preset")
	EPR.constSciencePacks["space-science"] = EPR.constSciencePacks["promethium-science"]
	EPR.constSciencePacks["one-planetary-science"]["space-science-pack"] = false
	EPR.constSciencePacks["any-planetary-science"]["space-science-pack"] = false
	EPR.constSciencePacks["all-planetary-science"]["space-science-pack"] = false
	EPR.getTechLevelFromSciencePack["space-science-pack"] = 10
end

function EPR.getHighestKey(list)
	if not list then
		return nil
	end

	local max_key
	local max_value = 0
	for key, val in pairs(list) do
		if val and val > max_value then
			max_key = key
			max_value = val
		end
	end

	return max_key
end

function EPR.listContains(list, value)
	if not list or not value then
		return false
	end

	for _, item in pairs(list) do
		if item == value then
			return true
		end
	end

	return false
end

function EPR.toString(object, name)
	result = ""
	if name then
		result = name.." = "
	end
	if type(object) == "table" then
		result = result.."{ "
		for a,b in pairs(object) do
			result = result..EPR.toString(b, a)..", "
		end
		result = result.." }"
	else
		result = result..tostring(object)
	end
	return result
end

function EPR.getItem(item_name)
	if not item_name then
		return nil
	end

	for _, cat in pairs(EPR.constItemCategories) do
		if data.raw[cat] then
			if data.raw[cat][item_name] then
				return data.raw[cat][item_name]
			end
		end
	end

	return nil
end

function EPR.getItemType(item)
	if not item or not item.type then
		return nil
	end

	return item.type == "tool" and "science_pack" or "item"
end

function EPR.createProductivityIcon()
	return {icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-recipe-productivity.png", icon_size = 64}
end

function EPR.createIconForItem(item)
	if not item then
		return {EPR.createProductivityIcon()} -- default icon is just the productivity badge
	end

	if not item.icon then
		if not item.icons then -- neither icon + icons should be impossible
			return {EPR.createProductivityIcon()}
		end

		local icons = table.deepcopy(item.icons)
		table.insert(icons, EPR.createProductivityIcon())
		return icons
	end

	return {{icon = item.icon, icon_size = item.icon_size}, EPR.createProductivityIcon()}
end

function EPR.combineItems(list, main, ...)
    local arg={...}
	if not list or not main or #arg == 0 or not list[main] then
		return
	end

	local mainEntry = list[main]
	for _, item in ipairs(arg) do
		if item ~= main then
			local itemEntry = list[item]
			if itemEntry then
				if EPR.setting["verbose"] then
					log("EPR: Adding technologies of "..item.." to "..main)
				end
				if itemEntry.effects then
					for _, effect in pairs(itemEntry.effects) do
						table.insert(mainEntry.effects, effect)
					end
				end
				if itemEntry.enabled_at_start then
					mainEntry.enabled_at_start = true
				end
				if itemEntry.lowest_tech then
					mainEntry.lowest_tech = EPR.getLowestTech(mainEntry.lowest_tech, itemEntry.lowest_tech)
				end
				list[item] = nil
			end
		end
	end
end

function EPR.combineGroup(itemList, main, itemGroup)
	EPR.combineGroupExcept(itemList, main, itemGroup, nil)
end

function EPR.combineGroupExcept(itemList, main, itemGroup, exclusion)
	if not itemList or not itemGroup then
		return
	end

	for name, _ in pairs(itemGroup) do
		if name ~= main and not EPR.listContains(exclusion, name) then
			EPR.combineItems(itemList, main, name)
		end
	end
end

function EPR.combineItemSubgroup(itemList, main, subgroup)
	if not itemList or not main or not subgroup then
		return
	end

	local results = {}
	for key, item in pairs(data.raw["item"]) do
		if item and item.subgroup == subgroup then
			table.insert(results, key)
		end
	end

	EPR.combineItems(itemList, main, table.unpack(results))
end

function EPR.hasValidLab(ingredients)
	if not ingredients then
		return false
	end

	for key, lab in pairs(data.raw["lab"]) do
		if lab and lab.inputs then
			local compatible = true
			for _, ingr in pairs(ingredients) do
				local found = false
				for _, input in pairs(lab.inputs) do
					found = found or input == ingr[1]
				end
				compatible = compatible and found
			end
			if compatible then
				return true
			end
		end
	end

	return false
end

function EPR.isRecipeInScope(recipe)
	-- technically not in scope
	if not recipe or not recipe.name or recipe.hidden or not recipe.results or not recipe.results[1] or not recipe.results[1].name then
		return false
	end

	-- ignoring barreling and recycling
	if recipe.category == "recycling" or EPR.listContains({"fill-barrel", "empty-barrel", "liquid-empty", "liquid-fill"}, recipe.subgroup) then
		return false
	end

	if recipe.allow_productivity then
		return true
	end

	if EPR.setting["choose_recipes"] == "all" then
		return true
	end

	local item = recipe.results[1].name

	if EPR.setting["choose_recipes"] == "all_but_equipment" then
		if data.raw["roboport-equipment"][item] or data.raw["night-vision-equipment"][item] or data.raw["battery-equipment"][item] or data.raw["belt-immunity-equipment"][item] or data.raw["movement-bonus-equipment"][item] or data.raw["energy-shield-equipment"][item] or data.raw["active-defense-equipment"][item] or data.raw["generator-equipment"][item] or data.raw["inventory-bonus-equipment"][item] or data.raw["solar-panel-equipment"][item] then
			return false
		end
		if data.raw["locomotive"][item] or data.raw["cargo-wagon"][item] or data.raw["fluid-wagon"][item] or data.raw["car"][item] or data.raw["spider-vehicle"][item] or data.raw["artillery-wagon"][item] or data.raw["armor"][item] or data.raw["gun"][item] then
			return false
		end
		return true
	end

	if data.raw["tile"][item] then
		return string.find(EPR.setting["choose_recipes"], "tiles")
	end

	if data.raw["ammo"][item] then
		return string.find(EPR.setting["choose_recipes"], "ammo")
	end

	if data.raw["module"][item] then
		return string.find(EPR.setting["choose_recipes"], "modules")
	end

	return false
end

function EPR.isSciencePackRequired(pack_name, tech_name)
	if not pack_name or not tech_name then
		return false
	end

	if pack_name == tech_name then
		return true
	end

	local tech = data.raw["technology"][tech_name]
	if not tech then
		return false
	end

	if tech.unit then
		for _, pack in pairs(tech.unit.ingredients) do
			if pack[1] == pack_name then
				return true
			end
		end
	end

	local checked = {}
	local queue = { tech_name }
	while next(queue) ~= nil do
		local current = table.remove(queue, 1)
		if not checked[current] then
			if current == pack_name then
				return true
			end
			checked[current] = true
			local techn = data.raw["technology"][current]
			if techn and techn.prerequisites then
				for _, val in pairs(techn.prerequisites) do
					table.insert(queue, val)
				end
			end
		end
	end

	return false
end

function EPR.isTechRequiredForScience(tech_name, pack_name)
	if not tech_name or not pack_name then
		return false
	end

	if tech_name == pack_name then
		return true
	end

	local checked = {}
	local queue = { pack_name }
	while next(queue) ~= nil do
		local current = table.remove(queue, 1)
		if not checked[current] then
			if current == tech_name then
				return true
			end
			checked[current] = true
			local techn = data.raw["technology"][current]
			if techn and techn.prerequisites then
				for _, val in pairs(techn.prerequisites) do
					table.insert(queue, val)
				end
			end
		end
	end

	return false
end

function EPR.addMissingPlanetaryScience(current, special, setting)
	if not current then
		return nil
	end

	-- check if needed
	if (setting == "one-planetary-science"
		or setting == "any-planetary-science")
			and not current["metallurgic-science-pack"]
			and not current["electromagnetic-science-pack"]
			and not current["agricultural-science-pack"]
			and not current["cryogenic-science-pack"] then

		-- add level with one or more of the planetary packs
		if next(special) ~= nil then
			if setting == "one-planetary-science" then
				local pack = EPR.getHighestKey(special)
				current[pack] = true
				return pack
			else
				local packs = {}
				for key, val in pairs(special) do
					if val then
						current[key] = true
						table.insert(packs, key)
					end
				end
				return packs
			end
		end
	end

	-- nothing added
	return nil
end

function EPR.addMissingSciencePacks(science_packs, tech)
	local technology = data.raw["technology"][tech]
	local highest_science_pack
	local highest_level = -1
	if technology and technology.unit and technology.unit.ingredients then -- if tech is regular technology
		for _, val in pairs(technology.unit.ingredients) do
			local level = EPR.getTechLevelFromSciencePack[val[1]] or -2
			if level > highest_level then
				highest_level = level
				highest_science_pack = val[1]
			elseif level == highest_level then
				if type(highest_science_pack) == "table" then
					if not EPR.listContains(highest_science_pack, val[1]) then
						table.insert(highest_science_pack, val[1])
					end
				elseif highest_science_pack ~= val[1] then
					highest_science_pack = { highest_science_pack, val[1] }
				end
			end
			science_packs[val[1]] = true
		end
	elseif technology and technology.prerequisites then -- if tech is trigger-technology check prerequisites
		for _, pre in pairs(technology.prerequisites) do
			if pre then
				local highest = EPR.addMissingSciencePacks(science_packs, pre)
				local level = EPR.getTechLevelFromSciencePack[highest] or -2
				if level > highest_level then
					highest_level = level
					highest_science_pack = highest
				elseif level == highest_level then
					if type(highest_science_pack) == "table" then
						if not EPR.listContains(highest_science_pack, highest) then
							table.insert(highest_science_pack, highest)
						end
					elseif highest_science_pack ~= highest then
						highest_science_pack = { highest_science_pack, highest }
					end
				end
			end
		end
	end
	return highest_science_pack, highest_level
end

function EPR.getLowestTech(first, second)
	if not first then
		if not second then
			return nil
		else
			return second
		end
	end
	if not second then
		return first
	end

	local firstTech = data.raw["technology"][first]
	local secondTech = data.raw["technology"][second]

	if not firstTech then
		if not secondTech then
			return nil
		else
			return second
		end
	end
	if not secondTech then
		return first
	end

	if firstTech.prerequisites then
		if secondTech.prerequisites then
			-- both have prerequisites
			local maxIngredientsFirst
			local maxIngredientsSecond

			if firstTech.unit and firstTech.unit.ingredients then
				maxIngredientsFirst = #firstTech.unit.ingredients
			end
			if secondTech.unit and secondTech.unit.ingredients then
				maxIngredientsSecond = #secondTech.unit.ingredients
			end

			local checked = {}
			local queue = table.deepcopy(firstTech.prerequisites)
			while next(queue) ~= nil do
				local current = table.remove(queue, 1)
				if not checked[current] then
					if current == second then
						return second
					end
					checked[current] = true
					local currentTech = data.raw["technology"][current]
					if currentTech then
						if not maxIngredientsFirst and currentTech.unit and currentTech.unit.ingredients then
							maxIngredientsFirst = #currentTech.unit.ingredients
						end
						if currentTech.prerequisites then
							for _, val in pairs(currentTech.prerequisites) do
								table.insert(queue, val)
							end
						end
					end
				end
			end

			checked = {}
			queue = table.deepcopy(secondTech.prerequisites)
			while next(queue) ~= nil do
				local current = table.remove(queue, 1)
				if not checked[current] then
					if current == first then
						return first
					end
					checked[current] = true
					local currentTech = data.raw["technology"][current]
					if currentTech then
						if not maxIngredientsSecond and currentTech.unit and currentTech.unit.ingredients then
							maxIngredientsSecond = #currentTech.unit.ingredients
						end
						if currentTech.prerequisites then
							for _, val in pairs(currentTech.prerequisites) do
								table.insert(queue, val)
							end
						end
					end
				end
			end

			-- neither techs are in the prerequisite tree of the other - compare science pack count
			if maxIngredientsFirst and maxIngredientsSecond then
				if maxIngredientsFirst > maxIngredientsSecond then
					return second
				end
			end
		else
			-- only first has prerequisites, second is available right away
			return second
		end
	end

	-- if all else fails, use first by default
	-- e.g., first is available right away, default to first being lower, even if second also has no prerequisites
	return first
end

function EPR.getIngredients(science_pack_list)
	if not science_pack_list then
		return nil
	end

	local result = {}
	for key, val in pairs(science_pack_list) do
		if key and val then
			table.insert(result, { key, 1})
		end
	end

	return result
end

function EPR.getPrerequisites(lowest_tech, highest_science_pack)
	if lowest_tech then
		if highest_science_pack then
			if type(highest_science_pack) == "table" then
				local result = {}
				local tech_added = false
				for _, pack in pairs(highest_science_pack) do
					if not tech_added and EPR.isSciencePackRequired(pack, lowest_tech) then
						table.insert(result, lowest_tech)
						tech_added = true
					else
						table.insert(result, pack)
					end
				end

				if not tech_added then
					table.insert(result, lowest_tech)
				end
				return result
			else
				if EPR.isSciencePackRequired(highest_science_pack, lowest_tech) then
					return { lowest_tech }
				elseif EPR.isTechRequiredForScience(lowest_tech, highest_science_pack) then
					return { highest_science_pack }
				else
					return { lowest_tech, highest_science_pack }
				end
			end
		else
			return { lowest_tech }
		end
	elseif highest_science_pack then
		if type(highest_science_pack) == "table" then
			return highest_science_pack
		else
			return { highest_science_pack }
		end
	else
		return nil
	end
end

function EPR.getTechLevels(item, lowest_tech, special_science_packs)
	local tech_levels = {}
	local current_science_packs = table.deepcopy(EPR.constSciencePacks[EPR.setting["minimum_science_pack"][EPR.getItemType(item)]])

	-- adjust if levels are skipped
	if EPR.setting["skip_utility"][EPR.getItemType(item)] then
		current_science_packs["utility-science-pack"] = false
	end
	if EPR.setting["skip_military"][EPR.getItemType(item)] then
		current_science_packs["military-science-pack"] = false
	end

	local highest_science_pack = EPR.constHighestSciencePacks[EPR.setting["minimum_science_pack"][EPR.getItemType(item)]]
	-- get science requirements from lowest_tech, i.e., check if additional science packs are needed
	if lowest_tech then
		local new_highest, level = EPR.addMissingSciencePacks(current_science_packs, lowest_tech)
		if new_highest and level > EPR.getTechLevelFromSciencePack[highest_science_pack] then
			highest_science_pack = new_highest
		end
	end

	-- add planetary science if needed
	highest_science_pack = EPR.addMissingPlanetaryScience(current_science_packs, special_science_packs, EPR.setting["minimum_science_pack"][EPR.getItemType(item)]) or highest_science_pack
	table.insert(tech_levels, { packs = table.deepcopy(current_science_packs), highest_science_pack = highest_science_pack })

	local max_packs = EPR.constSciencePacks[EPR.setting["maximum_science_pack"][EPR.getItemType(item)]]

	local previous_level = -1
	for pack, val in pairs(max_packs) do
		if val and not current_science_packs[pack]
				and not (pack == "military-science-pack" and EPR.setting["skip_military"][EPR.getItemType(item)])
				and not (pack == "utility-science-pack" and EPR.setting["skip_utility"][EPR.getItemType(item)]) then
			local current_level = EPR.getTechLevelFromSciencePack[pack] or -2
			if current_level > previous_level and previous_level > -1 then
				table.insert(tech_levels, { packs = table.deepcopy(current_science_packs), highest_science_pack = highest_science_pack })
			end
			if current_level == previous_level then
				if type(highest_science_pack) == "table" then
					table.insert(highest_science_pack, pack)
				else
					highest_science_pack = { highest_science_pack, pack }
				end
			else
				highest_science_pack = pack
			end
			previous_level = current_level
			current_science_packs[pack] = true
		end
	end
	if previous_level > -1 then
		table.insert(tech_levels, { packs = table.deepcopy(current_science_packs), highest_science_pack = highest_science_pack })
	end

	-- add last level if needed
	local new_highest = EPR.addMissingPlanetaryScience(current_science_packs, special_science_packs, EPR.setting["maximum_science_pack"][EPR.getItemType(item)])
	if new_highest then
		table.insert(tech_levels, { packs = table.deepcopy(current_science_packs), highest_science_pack = new_highest })
	end

	return tech_levels
end

function EPR.createTechnologyForTechLevel(item, item_object, lowest_tech, tech_level, level, noOfTechs)
	if not item or not item.name or not item_object or not item_object.effects or not level or level < 1 or not noOfTechs or level > noOfTechs or not tech_level then
		return nil
	end

	local prerequisites = EPR.getPrerequisites(lowest_tech, tech_level.highest_science_pack)
	if level > 1 then
		table.insert(prerequisites, EPR.prefix(item.name.."-productivity-"..(level-1)))
	end

	local final = level == noOfTechs
	-- if tech has a max level in settings then use that, else "infinite"
	local maximum_level = (final and not EPR.setting["infinite_tech"][EPR.getItemType(item)])
		and EPR.setting["max_level_value"][EPR.getItemType(item)]
		or "infinite"

	if maximum_level ~= "infinite" and maximum_level < level then
	-- tech is already above limit set in settings
		return nil
	end

	local ingredients = EPR.getIngredients(tech_level.packs)
	if not EPR.hasValidLab(ingredients) then
		if EPR.setting["verbose"] then
			log("> EPR: no valid lab found for "..EPR.prefix(item.name.."-productivity-"..level))
		end
		return nil
	end

	local unit = {ingredients = ingredients, time = 60}
	if final then
		unit["count_formula"] = EPR.setting["formula_factor"][EPR.getItemType(item)].."^(L-"..(noOfTechs - 1)..")*"..EPR.setting["formula_base"][EPR.getItemType(item)]
	else
		-- if not infinite will give a fraction of the first infinite's level cost
		-- rounded to hundreds (because it looks nicer), but at least 10 for the weird
		-- case that due to lowered settings less than 100 packs are required
		unit["count"] = math.max(math.floor(EPR.setting["formula_factor"][EPR.getItemType(item)] * EPR.setting["formula_base"][EPR.getItemType(item)] * level / noOfTechs / 100) * 100, 10)
	end

	local tech = {
		type = "technology",
		name = EPR.prefix(item.name.."-productivity-"..level),
		icons = EPR.createIconForItem(item),
		effects = item_object.effects,
		unit = unit,
		prerequisites = prerequisites,
		upgrade = true
	}

	local localised_name = item_object.localised_name
	if not localised_name then
		localised_name = item.localised_name
	end
	if not localised_name then
		localised_name = {"?", {"item-name."..item.name}, {"fluid-name."..item.name}, {"entity-name."..item.name}, {"equipment-name."..item.name}}
	end

	if final then
		tech.localised_name = {"technology-name."..EPR.prefix("productivity_tech_final"), localised_name}
	else
		tech.localised_name = {"technology-name."..EPR.prefix("productivity_tech"), localised_name, tostring(level)}
	end
	tech.localised_description = {"technology-description."..EPR.prefix("productivity_tech"), localised_name}

	if final then
		tech["max_level"] = maximum_level
	end

	return tech
end

function EPR.generateAllProductivityTechs(blacklist_techs, blacklist_products, blacklist_recipe)
	log("### EPR: Generating all productivity techs ###")

	log("# EPR: Scanning technologies #")
	-- build list of existing productivity techs and their recipes
	-- plus a dictionary of recipes to their lowest, i.e., cheapest unlock technology
	local exclude_recipe = table.deepcopy(blacklist_recipe)
	local existing_prod_techs = {}
	local recipes_lowest_tech = {}
	local recipes_enabled_at_start = {}
	for tech_name, tech in pairs(data.raw["technology"]) do
		if tech and tech.effects then
			if not EPR.listContains(blacklist_recipe, tech_name) then
				for _, effect in pairs(tech.effects) do
					if effect.type == "change-recipe-productivity" then
						local recipe = data.raw["recipe"][effect.recipe]
						if recipe then
							table.insert(exclude_recipe, recipe.name)
							if existing_prod_techs[tech_name] then
								table.insert(existing_prod_techs[tech_name].recipes, recipe.name)
								existing_prod_techs[tech_name].enabled_at_start = existing_prod_techs[tech_name].enabled_at_start or recipe.enabled ~= false
							else
								existing_prod_techs[tech_name] = { recipes = { recipe.name }, enabled_at_start = recipe.enabled ~= false }
							end
						end
					elseif effect.type == "unlock-recipe" then
						local recipe = data.raw["recipe"][effect.recipe]
						-- the default is true, i.e., nil means true -> ~= false
						if recipe and recipe.name then
							if recipes_lowest_tech[recipe.name] then
								recipes_lowest_tech[recipe.name] = EPR.getLowestTech(recipes_lowest_tech[recipe.name], tech_name)
							else
								recipes_lowest_tech[recipe.name] = tech_name
							end
							recipes_enabled_at_start[recipe.name] = recipe.enabled ~= false
						end
					end
				end
			end
		end
	end

	log("# EPR: Scanning recipes #")
	-- determine all recipe categories for debugging purposes
	local categs = {}
	-- create list of items (and consequently of productivity technologies)
	local itemList = {}
	for _, recipe in pairs(data.raw["recipe"]) do
		if EPR.isRecipeInScope(recipe) then
			-- collect crafting categories for debug purposes
			local cat = recipe.category
			local addcat = true
			for _, v in pairs(categs) do
				addcat = addcat and v ~= cat
			end
			if addcat then
				table.insert(categs, cat)
			end

			if not EPR.listContains(exclude_recipe, recipe.name) then
				local idx = 1
				local finished = false
				while not finished and idx <= #recipe.results do
					local item_name = recipe.results[idx].name
					if not EPR.listContains(blacklist_products, item_name) then
						-- add to item list
						if EPR.setting["verbose"] then
							log("EPR: Adding recipe "..tostring(recipe.name).." to item "..item_name)
						end
						local effect = {
							type = "change-recipe-productivity",
							recipe = recipe.name,
							change = 0.1
						}
						local sp = EPR.convertRecipeCategoryToAdvancedSciencePack[recipe.category]
						local lowest_tech = recipes_lowest_tech[recipe.name]
						if itemList[item_name] then
							table.insert(itemList[item_name].effects, effect)
							itemList[item_name].enabled_at_start = itemList[item_name].enabled_at_start or recipe.enabled ~= false
							itemList[item_name].lowest_tech = EPR.getLowestTech(itemList[item_name].lowest_tech, lowest_tech)
						else
							itemList[item_name] = { effects = { effect }, special_packs = {}, enabled_at_start = recipe.enabled ~= false, lowest_tech = lowest_tech }
						end
						if sp then
							local current = (itemList[item_name].special_packs[sp] or 0) + 1
							itemList[item_name].special_packs[sp] = current
						end
						finished = true
					else
						idx = idx + 1
					end
				end
			end
		end
	end

	-- only for debugging
	if EPR.setting["verbose"] then
		table.sort(categs)
		log(EPR.toString(categs, "EPR: Categories"))
	end

	log("# EPR: Grouping items")
	-- automatic grouping based on name
	for key, _ in pairs(itemList) do
		local hit = string.match(key, "-m?k?-?%d+$")
		if hit then
			local base = string.sub(key, 1, #key - #hit)
			local main
			if string.match(base, "^5d-") then -- 5dim support
				base = string.sub(base, 4)
			end
			if itemList[base] then
				main = base
			elseif itemList[base.."-1"] then
				main = base.."-1"
			elseif itemList["5d-"..base.."-01"] then
				main = "5d-"..base.."-01"
			elseif itemList[base.."-mk1"] then
				main = base.."-mk1"
			elseif itemList[base.."-mk-1"] then
				main = base.."-mk-1"
			end
			if main and key ~= main then
				if EPR.setting["verbose"] then
					log("Adding "..key.." to item "..main)
				end
				EPR.combineItems(itemList, main, key)
			end
		end
	end

	-- fixes
	if itemList["assembling-machine-1"] then
		itemList["assembling-machine-1"].localised_name = {"technology-name."..EPR.prefix("assembling_machine")}
	end

	-- explicit grouping
	-- all mining drills
	EPR.combineGroup(itemList, "electric-mining-drill", data.raw["mining-drill"])
	if itemList["electric-mining-drill"] then
		itemList["electric-mining-drill"].localised_name = {"technology-name."..EPR.prefix("mining_drill")}
	end

	-- all inserters
	EPR.combineGroup(itemList, "inserter", data.raw["inserter"])

	-- all belts
	EPR.combineGroup(itemList, "transport-belt", data.raw["transport-belt"])
	EPR.combineGroup(itemList, "underground-belt", data.raw["underground-belt"])
	EPR.combineGroup(itemList, "splitter", data.raw["splitter"])

	-- all containers
	EPR.combineGroup(itemList, "steel-chest", data.raw["container"])
	EPR.combineGroup(itemList, "steel-chest", data.raw["logistic-container"])
	if itemList["steel-chest"] then
		itemList["steel-chest"].localised_name = {"technology-name."..EPR.prefix("container")}
	end

	-- armor
	EPR.combineGroup(itemList, "power-armor", data.raw["armor"])
	if itemList["power-armor"] then
		itemList["power-armor"].localised_name = {"technology-name."..EPR.prefix("armor")}
	end

	-- weapon
	EPR.combineGroup(itemList, "submachine-gun", data.raw["gun"])
	if itemList["submachine-gun"] then
		itemList["submachine-gun"].localised_name = {"technology-name."..EPR.prefix("weapon")}
	end

	-- power poles
	EPR.combineGroup(itemList, "substation", data.raw["electric-pole"])
	if itemList["substation"] then
		itemList["substation"].localised_name = {"technology-name."..EPR.prefix("power_pole")}
	end

	-- furnaces
	-- EPR.combineGroup(itemList, "electric-furnace", data.raw["furnace"]) -- includes recycler for some reason
	EPR.combineItems(itemList, "electric-furnace", "steel-furnace", "stone-furnace", "5d-industrial-furnace")
	if itemList["electric-furnace"] then
		itemList["electric-furnace"].localised_name = {"technology-name."..EPR.prefix("furnace")}
	end

	-- labs
	EPR.combineGroup(itemList, "lab", data.raw["lab"])
	if itemList["lab"] then
		itemList["lab"].localised_name = {"technology-name."..EPR.prefix("lab")}
	end

	-- repair tool
	EPR.combineGroup(itemList, "repair-pack", data.raw["repair-tool"])

	-- capsules
	EPR.combineItems(itemList, "grenade", "cluster-grenade")
	EPR.combineItems(itemList, "poison-capsule", "slowdown-capsule")
	EPR.combineItems(itemList, "defender-capsule", "distractor-capsule", "destroyer-capsule")

	-- ammo
	EPR.combineItems(itemList, "firearm-magazine", "piercing-rounds-magazine", "uranium-rounds-magazine", "shotgun-shell", "piercing-shotgun-shell")
	EPR.combineItems(itemList, "cannon-shell", "explosive-cannon-shell", "uranium-cannon-shell", "explosive-uranium-cannon-shell", "artillery-shell")
	EPR.combineItems(itemList, "rocket", "explosive-rocket", "atomic-bomb", "capture-robot-rocket")

    -- flamethrower
	EPR.combineItems(itemList, "flamethrower-turret", "flamethrower-ammo")

    -- railgun
	EPR.combineItems(itemList, "railgun-turret", "railgun-ammo")

    -- tesla
	EPR.combineItems(itemList, "tesla-turret", "tesla-ammo")

	-- robots
	EPR.combineGroup(itemList, "construction-robot", data.raw["construction-robot"])
	EPR.combineGroup(itemList, "construction-robot", data.raw["logistic-robot"])

	-- personal equipment
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["roboport-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["night-vision-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["battery-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["belt-immunity-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["movement-bonus-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["energy-shield-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["active-defense-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["generator-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["inventory-bonus-equipment"])
	EPR.combineGroup(itemList, "personal-roboport-equipment", data.raw["solar-panel-equipment"])
	if itemList["personal-roboport-equipment"] then
		itemList["personal-roboport-equipment"].localised_name = {"technology-name."..EPR.prefix("equipment")}
	end

	-- boiler = boiler + heat exchanger + heating pipe
	-- generator = steam engine + turbine
	-- nuclear reactor + heating tower
	EPR.combineGroup(itemList, "boiler", data.raw["boiler"])
	EPR.combineGroup(itemList, "boiler", data.raw["heat-pipe"])
	EPR.combineGroup(itemList, "steam-engine", data.raw["generator"])
	EPR.combineGroup(itemList, "nuclear-reactor", data.raw["reactor"])

	-- mobility
	EPR.combineGroup(itemList, "locomotive", data.raw["locomotive"])
	EPR.combineGroup(itemList, "locomotive", data.raw["cargo-wagon"])
	EPR.combineGroup(itemList, "locomotive", data.raw["fluid-wagon"])
	if itemList["locomotive"] then
		itemList["locomotive"].localised_name = {"technology-name."..EPR.prefix("train")}
	end
	EPR.combineGroup(itemList, "car", data.raw["car"])
	EPR.combineGroup(itemList, "car", data.raw["spider-vehicle"])
	EPR.combineGroup(itemList, "car", data.raw["artillery-wagon"])
	if itemList["car"] then
		itemList["car"].localised_name = {"technology-name."..EPR.prefix("vehicle")}
	end

	-- train signals
	EPR.combineGroup(itemList, "train-stop", data.raw["rail-signal"])
	EPR.combineGroup(itemList, "train-stop", data.raw["rail-chain-signal"])

	-- rails
	EPR.combineGroup(itemList, "rail", data.raw["rail-planner"])
	EPR.combineItems(itemList, "rail", "rail-support", "rail-ramp")

	-- pipe
	EPR.combineGroup(itemList, "pipe", data.raw["pipe"])
	EPR.combineGroup(itemList, "pipe", data.raw["pipe-to-ground"])

	-- concrete
	EPR.combineItems(itemList, "concrete", "refined-concrete", "hazard-concrete", "refined-hazard-concrete", "dect-concrete-grid")
	-- dectorio concrete
	EPR.combineItemSubgroup(itemList, "concrete", "flooring-painted")
	EPR.combineItemSubgroup(itemList, "concrete", "flooring-painted-refined")
	EPR.combineItemSubgroup(itemList, "concrete", "flooring-painted-refined-base")

	-- foundation
	EPR.combineItems(itemList, "foundation", "ice-platform")

	-- lightning collector
	EPR.combineGroup(itemList, "lightning-collector", data.raw["lightning-attractor"])

	-- reactors
	EPR.combineGroup(itemList, "fusion-reactor", data.raw["fusion-reactor"])
	EPR.combineGroup(itemList, "fusion-reactor", data.raw["fusion-generator"])

	-- walls and gates
	EPR.combineGroup(itemList, "stone-wall", data.raw["wall"])
	EPR.combineGroup(itemList, "stone-wall", data.raw["gate"])

	-- lamps (usually not needed)
	EPR.combineGroup(itemList, "small-lamp", data.raw["lamp"])

	-- pumps
	EPR.combineGroup(itemList, "pump", data.raw["pump"])
	EPR.combineGroup(itemList, "pump", data.raw["offshore-pump"])

	if mods["space-age"] then
		-- space platform starter packs
		EPR.combineGroup(itemList, "space-platform-foundation", data.raw["space-platform-starter-pack"])
	end

	-- landfill
	if itemList["landfill"] then
		EPR.combineGroupExcept(itemList, "landfill", data.raw["tile"], {"space-platform-foundation", "concrete", "foundation", "dect-concrete-grid"})
		-- dectorio landscaping
		EPR.combineItems(itemList, "landfill", "dect-base-dirt-1", "dect-base-dry-dirt", "dect-base-grass-1", "dect-base-red-desert-1", "dect-base-sand-1")
		EPR.combineItems(itemList, "dect-base-water", "dect-base-deepwater", "dect-base-water-green", "dect-base-deepwater-green")
		EPR.combineItemSubgroup(itemList, "landfill", "landscaping-trees")
		EPR.combineItemSubgroup(itemList, "landfill", "landscaping-rocks")
	end

	-- dectorio traffic bollard
	EPR.combineItems(itemList, "plastic-bar", "dect-traffic-bollard")

	-- 5dim-turrets
	EPR.combineItems(itemList, "gun-turret", "5d-gun-turret-small-01", "5d-gun-turret-big-01", "5d-gun-turret-sniper-01")
	EPR.combineItems(itemList, "laser-turret", "5d-laser-turret-small-01", "5d-laser-turret-big-01", "5d-laser-turret-sniper-01")

	-- circuit stuff (usually deactivated)
	if itemList["arithmetic-combinator"] then
		EPR.combineItems(itemList, "arithmetic-combinator", "decider-combinator", "constant-combinator", "power-switch", "programmable-speaker", "display-panel", "selector-combinator")
	end

	if itemList["loader"] then
		EPR.combineGroup(itemList, "loader", data.raw["loader"])
		EPR.combineGroup(itemList, "loader", data.raw["loader-1x1"])
	end

	log("# EPR: Creating technologies #")
	local new_technologies = {}

	for item_name, item_object in pairs(itemList) do
		if item_name and item_object and item_object.effects and #item_object.effects > 0 then
			-- get basic info about current item/fluid
			local item = EPR.getItem(item_name)

			if item then
				if EPR.setting["verbose"] then
					log("EPR: current item/fluid: "..item_name)
				end

				-- determine lowest necessary tech and build tech levels based on science pack progression
				local lowest_tech
				if not item_object.enabled_at_start then
					lowest_tech = item_object.lowest_tech
				end

				local tech_levels = EPR.getTechLevels(item, lowest_tech, item_object.special_packs)

				for idx, tech_level in pairs(tech_levels) do
					local next_tech = EPR.createTechnologyForTechLevel(item, item_object, lowest_tech, tech_level, idx, #tech_levels)
					if next_tech then
						if EPR.setting["verbose"] then
							log("> EPR: adding level "..idx.." with "..EPR.toString(tech_level))
						end
						table.insert(new_technologies, next_tech)
					end
				end
			else
				log("EPR: could not find item/fluid "..item_name)
			end
		end
	end

	log("# EPR: adding technologies to the game #")
	if #new_technologies > 0 then
		data:extend(new_technologies)
	end

	if EPR.setting["adjust_existing_techs"] then
		log("# EPR: adjusting existing technologies to same progression #")
		for key, value in pairs(existing_prod_techs) do
			local tech = data.raw["technology"][key]
			-- check if tech exists and is not already part of a progression
			if tech
					and not string.match(key, "-%d+$") -- end with a number, so most likely there's other similar technologies
					and not data.raw["technology"][key.."-2"] then -- does not end with a number, so could be the first of a sequence ("-1" omitted)
				if EPR.setting["verbose"] then
					log("> EPR: adjusting "..key)
				end
				local lowest_tech
				local special_science_packs = {}
				if not value.enabled_at_start then
					for _, val in pairs(value.recipes) do
						local recipe = data.raw["recipe"][val]
						if recipe then
							local sp = EPR.convertRecipeCategoryToAdvancedSciencePack[recipe.category]
							if sp then
								local current = (special_science_packs[sp] or 0) + 1
								special_science_packs[sp] = current
							end
							if not lowest_tech then
								lowest_tech = recipes_lowest_tech[val]
							else
								lowest_tech = EPR.getLowestTech(recipes_lowest_tech[val], lowest_tech)
							end
						end
					end
				end
				EPR.adjustProductivityTechnology(tech, lowest_tech, special_science_packs)
			end
		end
	end
end

function EPR.adjustProductivityTechnology(technology, lowest_tech, special_science_packs)
	if not technology or not technology.effects or not technology.unit or not technology.unit.ingredients then
		return
	end
	-- find tech levels
	local tech_levels = EPR.getTechLevels({ type = "item" }, lowest_tech, special_science_packs)

	-- update tech according to lowest tech level
	-- always adjust ingredients and prerequisites
	technology.unit.ingredients = EPR.getIngredients(tech_levels[1].packs)
	technology.prerequisites = EPR.getPrerequisites(lowest_tech, tech_levels[1].highest_science_pack)

	if #tech_levels > 1 then
		-- make finite
		technology.max_level = nil
		technology.unit.count_formula = nil
		technology.unit.count = math.max(math.floor(EPR.setting["formula_factor"]["item"] * EPR.setting["formula_base"]["item"] / #tech_levels / 100) * 100, 10)
	else
		-- keep infinite, adjust max level
		if not EPR.setting["infinite_tech"]["item"] then
			technology.max_level = EPR.setting["max_level_value"]["item"]
		end
	end

	-- build additional levels on top until maximum level
	if #tech_levels > 1 then
		local additional_techs = {}
		for idx, tech_level in pairs(tech_levels) do
			if idx > 1 then
				local ingredients = EPR.getIngredients(tech_level.packs)

				local prerequisites = EPR.getPrerequisites(lowest_tech, tech_level.highest_science_pack)
				if idx > 2 then
					table.insert(prerequisites, technology.name.."-"..tostring(idx-1))
				else
					table.insert(prerequisites, technology.name)
				end

				local final = idx == #tech_levels
				local maximum_level = (final and not EPR.setting["infinite_tech"]["item"])
									and EPR.setting["max_level_value"]["item"]
									or "infinite"

				if maximum_level == "infinite" or maximum_level >= idx then
					local next_tech = table.deepcopy(technology)

					next_tech.name = next_tech.name.."-"..tostring(idx)
					next_tech.prerequisites = prerequisites
					next_tech.unit.ingredients = ingredients

					if final then
						next_tech.max_level = maximum_level
						next_tech.unit.count = nil
						next_tech.unit.count_formula = EPR.setting["formula_factor"]["item"].."^(L-"..(#tech_levels - 1)..")*"..EPR.setting["formula_base"]["item"]
					else
						next_tech.max_level = nil
						next_tech.unit.count = math.max(math.floor(EPR.setting["formula_factor"]["item"] * EPR.setting["formula_base"]["item"] * idx / #tech_levels / 100) * 100, 10)
						next_tech.unit.count_formula = nil
					end

					table.insert(additional_techs, next_tech)
				end
			end
		end

		if #additional_techs > 0 then
			data:extend(additional_techs)
		end
	end
end
