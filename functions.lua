EPR = {}

function EPR.prefix(name)
    return "epr_" .. name
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
	["adjust_existing_techs"] = settings.startup[EPR.prefix("adjust_existing_techs")] and settings.startup[EPR.prefix("adjust_existing_techs")].value or false
}

EPR.convertRecipeCategoryToAdvancedSciencePack = {
	["advanced-centrifuging"] = "utility-science-pack",
	["advanced-centrifuging-or-crafting"] = "utility-science-pack",
	["advanced-centrifuging-or-crafting-with-fluid"] = "utility-science-pack",
	["advanced-crafting"] = "metallurgic-science-pack",
	["advanced-metallurgy"] = "metallurgic-science-pack",
	["ammunition"] = "metallurgic-science-pack",
	["biochemistry"] = "agricultural-science-pack",
	["biochemistry-or-organic"] = "agricultural-science-pack",
	["biochemistry-or-organic-or-assembling"] = "agricultural-science-pack",
	["biochemistry-or-organic-or-hand-crafting"] = "agricultural-science-pack",
	["captive-spawner-process"] = "agricultural-science-pack",
	["centrifuging"] = "utility-science-pack",
	["chemistry"] = "cryogenic-science-pack",
	["chemistry-or-cryogenics"] = "cryogenic-science-pack",
	["core-mining"] = "metallurgic-science-pack",
	["crafting"] = "utility-science-pack",
	["crafting-with-fluid"] = "utility-science-pack",
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
	["quantum-assembling-or-crafting"] = "utility-science-pack",
	["quantum-assembling-or-crafting-with-fluid"] = "utility-science-pack",
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
	["woodworking-or-organic-or-assembling"] = "agricultural-science-pack"
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

function EPR.addMissingSciencePacks(science_packs, tech)
	if tech.unit and tech.unit.ingredients then -- if tech is regular technology
		for _, val in pairs(tech.unit.ingredients) do
			science_packs[val[1]] = true
		end
	elseif tech.prerequisites then -- if tech is trigger-technology check prerequisites
		for _, pre in pairs(tech.prerequisites) do
			if pre then
				EPR.addMissingSciencePacks(science_packs, data.raw["technology"][pre])
			end
		end
	end
end

function EPR.isTechPrerequisite(tech, otherTech)
	if not tech or not tech.name or not otherTech or not otherTech.name or not otherTech.prerequisites then
		return false
	end

	if tech.name == otherTech.name then
		-- tech = otherTech usually means that the item is a science pack in which case we would otherwise add the technology twice as prerequisite
		return true
	end

	for _, p in pairs(otherTech.prerequisites) do
		if p == tech.name then
			return true
		elseif EPR.isTechPrerequisite(tech, data.raw["technology"][p]) then
			return true
		end
	end

	return false
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

function EPR.adjustProductivityTechnology(technology)
	if not technology or not technology.effects or not technology.unit or not technology.unit.ingredients then
		return
	end

	-- check all recipes (from effects) and their categories to determine special_science_packs
	local special_science_packs = {}
	local recipes = {}
	for _, effect in pairs(technology.effects) do
		if effect and effect.type == "change-recipe-productivity" then
			local recipe = data.raw["recipe"][effect.recipe]
			if recipe then
				table.insert(recipes, recipe)
				local sp = EPR.convertRecipeCategoryToAdvancedSciencePack[recipe.category]
				if sp then
					local current = (special_science_packs[sp] or 0) + 1
					special_science_packs[sp] = current
				end
			end
		end
	end

	-- find non-science pack requirements
	local lowest_tech = EPR.getLowestTechFromRecipes(recipes)

	-- find tech levels
	local tech_levels = EPR.getTechLevels({ type = "item" }, lowest_tech, special_science_packs)

	-- update tech according to lowest tech level
	-- always adjust ingredients and prerequisites
	technology.unit.ingredients = EPR.getIngredients(tech_levels[1])
	local highest_science_pack = EPR.getHighestSciencePack(tech_levels[1])
	technology.prerequisites = EPR.getPrerequisites(lowest_tech, highest_science_pack)

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
				local ingredients = EPR.getIngredients(tech_level)

				local highest_science_pack = EPR.getHighestSciencePack(tech_level)
				local prerequisites = EPR.getPrerequisites(lowest_tech, highest_science_pack)
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
			-- technology.upgrade = false
			data:extend(additional_techs)
		end
	end
end

function EPR.getLowestTechFromRecipes(recipes)
	if not recipes then
		return nil
	end

	for _, recipe in pairs(recipes) do
		if recipe.enabled ~= false then
			return nil -- no tech required, available at start
		end
	end

	local lowest_tech = nil
	for _, tech in pairs(data.raw["technology"]) do
		local tech_analyzed = false
		if tech and tech.effects then
			for _, unlock in pairs(tech.effects) do
				if not tech_analyzed and unlock and unlock.type == "unlock-recipe" and unlock.recipe then
					for _, rec in pairs(recipes) do
						if not tech_analyzed and rec and rec.name == unlock.recipe then
							-- this tech unlocks one of the recipes for the current item
							-- compare it to the current lowest_tech and update accordingly
							if not lowest_tech or EPR.isTechPrerequisite(tech, lowest_tech) then
								lowest_tech = tech
							end
							tech_analyzed = true
						end
					end
				end
			end
		end
	end

	return lowest_tech
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

	-- get science requirements from lowest_tech, i.e., check if additional science packs are needed
	if lowest_tech then
		EPR.addMissingSciencePacks(current_science_packs, lowest_tech)
	end

	table.insert(tech_levels, table.deepcopy(current_science_packs))

	local max_packs = EPR.constSciencePacks[EPR.setting["maximum_science_pack"][EPR.getItemType(item)]]

	local previous_level
	for pack, val in pairs(max_packs) do
		if val and not current_science_packs[pack]
				and not (pack == "military-science-pack" and EPR.setting["skip_military"][EPR.getItemType(item)])
				and not (pack == "utility-science-pack" and EPR.setting["skip_utility"][EPR.getItemType(item)]) then
			local current_level = EPR.getTechLevelFromSciencePack[pack]
			if previous_level and previous_level ~= current_level then
				table.insert(tech_levels, table.deepcopy(current_science_packs))
			end
			previous_level = current_level
			current_science_packs[pack] = true
		end
	end
	if previous_level then
		table.insert(tech_levels, table.deepcopy(current_science_packs))
	end

	-- add last level if needed
	if (EPR.setting["maximum_science_pack"][EPR.getItemType(item)] == "one-planetary-science"
		or EPR.setting["maximum_science_pack"][EPR.getItemType(item)] == "any-planetary-science")
			and not current_science_packs["metallurgic-science-pack"]
			and not current_science_packs["electromagnetic-science-pack"]
			and not current_science_packs["agricultural-science-pack"]
			and not current_science_packs["cryogenic-science-pack"] then

		-- need to add one last level with one of the planetary packs
		if next(special_science_packs) ~= nil then
			if EPR.setting["maximum_science_pack"][EPR.getItemType(item)] == "one-planetary-science" then
				current_science_packs[EPR.getHighestKey(special_science_packs)] = true
			else
				for key, val in pairs(special_science_packs) do
					if val then
						current_science_packs[key] = true
					end
				end
			end
			table.insert(tech_levels, table.deepcopy(current_science_packs))
		end
	end

	return tech_levels
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

function EPR.getHighestSciencePack(science_pack_list)
	if not science_pack_list then
		return nil
	end

	local result
	local result_level
	for key, val in pairs(science_pack_list) do
		if key and val then
			local key_level = EPR.getTechLevelFromSciencePack[key]
			if key_level then
				if not result_level then
					result = key
					result_level = EPR.getTechLevelFromSciencePack[key]
				elseif result_level == key_level then
					if type(result) == "table" then
						table.insert(result, key)
					else
						result = { result, key }
					end
				elseif result_level < key_level then
					result = key
					result_level = key_level
				end
			end
		end
	end

	return result
end

function EPR.getPrerequisites(lowest_tech, highest_science_pack)
	if lowest_tech then
		if not highest_science_pack then
			return { lowest.name }
		elseif type(highest_science_pack) == "table" then
			for _, pack in pairs(highest_science_pack) do
				local result = {}
				if EPR.isTechPrerequisite(lowest_tech, data.raw["technology"][pack]) or lowest_tech.name == pack then
					for _, val in pairs(highest_science_pack) do
						table.insert(result, val)
					end
					return result
				end
			end

			local result = { lowest_tech.name }
			for _, val in pairs(highest_science_pack) do
				if not EPR.isTechPrerequisite(val, lowest_tech) and lowest_tech.name ~= val then
					table.insert(result, val)
				end
			end
			return result
		else
			if EPR.isTechPrerequisite(data.raw["technology"][highest_science_pack], lowest_tech) or highest_science_pack == lowest_tech.name then
				return { lowest_tech.name }
			else
				return { highest_science_pack, lowest_tech.name }
			end
		end
	else
		if not highest_science_pack then
			return nil
		end
		if type(highest_science_pack) == "table" then
			local result = {}
			for _, val in pairs(highest_science_pack) do
				table.insert(result, val)
			end
			return result
		else
			return { highest_science_pack }
		end
	end

	return nil
end

function EPR.generateAllProductivityTechs(blacklist_techs, blacklist_products, blacklist_recipe)
	log("### EPR: Generating all productivity techs ###")

	log("# EPR: Looking for productivity techs #")
	local exclude_recipe = table.deepcopy(blacklist_recipe)
	local existing_prod_techs = {}
	for _, tech in pairs(data.raw["technology"]) do
		if tech and tech.effects then
			local exclude = false
			for _, val in pairs(blacklist_techs) do
				exclude = exclude or val == tech.name
			end
			if not exclude then
				for _, effect in pairs(tech.effects) do
					if effect and effect.type == "change-recipe-productivity" and effect.recipe then
						table.insert(exclude_recipe, effect.recipe)
						existing_prod_techs[tech.name] = true
						-- table.insert(existing_prod_techs, tech)
					end
				end
			end
		end
	end

	log("# EPR: Scanning recipes #")
	local categs = {}
	local itemList = {}
	for _, recipe in pairs(data.raw["recipe"]) do
		if recipe and recipe.name
				and recipe.allow_productivity
				and recipe.subgroup ~= "empty-barrel"
				and recipe.subgroup ~= "fill-barrel"
				and recipe.category ~= "recycling"
				and recipe.results
				and recipe.results[1]
				and recipe.results[1].name then
			-- collect crafting categories for debug purposes
			local cat = recipe.category
			local addcat = true
			for _, v in pairs(categs) do
				addcat = addcat and v ~= cat
			end
			if addcat then
				table.insert(categs, cat)
			end
			-- check recipe against blacklist
			local exclude = false
			for _, r in pairs(exclude_recipe) do
				exclude = exclude or r == recipe.name
			end
			if not exclude then
				local idx = 1
				local finished = false
				while not finished and idx <= #recipe.results do
					local item_name = recipe.results[idx].name
					-- check item/fluid against blacklist
					local exclude = false
					for _, p in pairs(blacklist_products) do
						exclude = exclude or p == item_name
					end
					if not exclude then
						-- add to item list
						log("EPR: Adding recipe "..tostring(recipe.name).." to item "..item_name)
						local effect = {
							type = "change-recipe-productivity",
							recipe = recipe.name,
							change = 0.1
						}
						local sp = EPR.convertRecipeCategoryToAdvancedSciencePack[recipe.category]
						if itemList[item_name] then
							table.insert(itemList[item_name].recipes, recipe)
							table.insert(itemList[item_name].effects, effect)
						else
							itemList[item_name] = { recipes = { recipe }, effects = { effect }, special_packs = {} }
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
	-- log(EPR.toString(categs, "EPR: Categories"))

	log("# EPR: Creating technologies #")
	local new_technologies = {}

	for item_name, item_object in pairs(itemList) do
		if item_name and item_object and item_object.recipes and #item_object.recipes > 0 then
			-- get basic info about current item/fluid
			local item = EPR.getItem(item_name)

			if item then
				log("EPR: current item/fluid: "..item_name)

				-- determine lowest necessary tech and build tech levels based on science pack progression
				local lowest_tech = EPR.getLowestTechFromRecipes(item_object.recipes)
				local tech_levels = EPR.getTechLevels(item, lowest_tech, item_object.special_packs)

				for idx, tech_level in pairs(tech_levels) do
					local next_tech = EPR.createTechnologyForTechLevel(item, item_object, lowest_tech, tech_level, idx, #tech_levels)
					if next_tech then
						log("> EPR: adding level "..idx.." with "..EPR.toString(tech_level))
						table.insert(new_technologies, next_tech)
					end
				end
			else
				log("EPR: could not find item/fluid "..item_name)
			end
		end
	end

	log("# EPR: adding technologies to the game")
	if #new_technologies > 0 then
		data:extend(new_technologies)
	end

	if EPR.setting["adjust_existing_techs"] then
		log("# EPR: adjusting existing technologies to same progression")
		for key, _ in pairs(existing_prod_techs) do
			local tech = data.raw["technology"][key]
			if tech then
				log("> EPR: adjusting "..tostring(tech.name))
				EPR.adjustProductivityTechnology(tech)
			end
		end
	end
end

function EPR.createTechnologyForTechLevel(item, item_object, lowest_tech, tech_level, level, noOfTechs)
	if not item or not item.name or not item_object or not item_object.effects or not level or level < 1 or not noOfTechs or not tech_level then
		return nil
	end

	local prerequisites = EPR.getPrerequisites(lowest_tech, EPR.getHighestSciencePack(tech_level))
	if level > 1 then
		table.insert(prerequisites, EPR.prefix(item.name.."-productivity-"..(level-1)))
	end

	local final = level == noOfTechs
	-- if tech has a max level in settings then use that, else "infinite"
	local maximum_level = (final and not EPR.setting["infinite_tech"][EPR.getItemType(item)])
		and EPR.setting["max_level_value"][EPR.getItemType(item)]
		or "infinite"

	-- tech is already above limit set in settings
	if maximum_level ~= "infinite" and maximum_level < level then
		return nil
	end

	local ingredients = EPR.getIngredients(tech_level)
	if not EPR.hasValidLab(ingredients) then
		log("> EPR: no valid lab found for "..EPR.prefix(item.name.."-productivity-"..level))
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

	if item.localised_name then
		if final then
			tech.localised_name = {"technology-name."..EPR.prefix("productivity_tech_final"), item.localised_name}
		else
			tech.localised_name = {"technology-name."..EPR.prefix("productivity_tech"), item.localised_name, tostring(level)}
		end
		tech.localised_description = {"technology-description."..EPR.prefix("productivity_tech"), item.localised_name}
	else
		local name = {"?", {"item-name."..item.name}, {"fluid-name."..item.name}, {"entity-name."..item.name}}
		if final then
			tech.localised_name = {"technology-name."..EPR.prefix("productivity_tech_final"), name}
		else
			tech.localised_name = {"technology-name."..EPR.prefix("productivity_tech"), name, tostring(level)}
		end
		tech.localised_description = {"technology-description."..EPR.prefix("productivity_tech"), name}
	end

	if final then
		tech["max_level"] = maximum_level
	end

	return tech
end

function EPR.getItem(item_name)
	if not item_name then
		return nil
	end

	return data.raw["item"][item_name] or data.raw["fluid"][item_name] or data.raw["capsule"][item_name] or data.raw["tool"][item_name]
end

function EPR.getItemType(item)
	if not item or not item.type then
		return nil
	end

	return item.type == "tool" and "science_pack" or "item"
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
