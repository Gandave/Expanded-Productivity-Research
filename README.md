# Expanded Productivity Research

This mod adds technologies for increasing the productivity of all intermediate recipes, similar to other mods like [Productivity Research For Everyone](https://mods.factorio.com/mod/ProductivityResearchForEveryone). Where it differs, however, is that it groups recipes that produce the same item into one technology. For example, you will get one technology for increasing the productivity of all solid fuel recipes instead of four separate ones. This is especially useful in combination with mods like [Vanilla Galore](https://mods.factorio.com/mod/vanilla_galore_continued) or [Space Age Galore](https://mods.factorio.com/mod/space_age_galore).

Additionally, research is staggered. Similar to how mining productivity, you can unlock the first level of productivity as soon as one recipe is unlocked and it only requires automation and logistic science packs. The next level adds chemical science packs, then purple science packs and so on until the final level which is infinite and repeatable. Pre-existing productivity technologies are adjusted to follow the same logic (can be deactivated).

Lastly, the progression is completely configurable and is, by default, different for science pack recipes.

# Mod compatibility

The generation of technologies is dynamic and should be flexible enough to be compatible with most mods right out of the gate. However, other mods might need to be flagged as optional dependencies if they add/change recipes in the final phase of initialization.

Where the mod will struggle is for recipes with multiple "main" products or where the "main" product is not the first result. Additionally, mods that remove science packs will most likely break the progression.

New science packs or lab types will be ignored by default.

# How it works
The mod scans all existing recipes that allow productivity and picks the first item as the main product. For each distinct main product, a series of technologies is created which increases the productivity of all recipes with that "main" product.

The first level of the technology requires the "lowest" technology that unlocks at least one of these recipes and requires the same science packs. The next level adds a new science pack and so on, until the full array of science packs required is complete, at which point the technology becomes infinite.

For example, *heavy oil* is the first result of *advanced oil processing*, *coal liquefaction* and *simple coal liquefaction*. The first level is unlocked right after *advanced oil processing* and requires automation, logistic and chemical science (default configuration). The next levels add production science, space science and finally agricultural science.

# How to configure
There are two sets of settings, one for "regular" intermediates and one for science pack recipes. Both work analogous and can be set to the same values for a uniform progression.

The cost factor and cost base determine the research cost formula, which is FACTOR ^ level * BASE. The default is 1.5 and 1000 which matches the Space Age techs (1500, 2250, 3375, etc.).

The non-infinite levels require a fraction based on how many levels there are and rounded down to a multiple of 100. E.g., processing unit productivity has four levels (chemical, +production, +space, +electromagnetic). The first level costs 1/4 * 1500 = 375, which is rounded down to 300.

Infinite tech and maximum level can be used to limit the maximum available technology level, since productivity is capped at 300% (barring other mods that change this). Or if you simply prefer to have a custom limit on the productivity gained by this mod.

Minimum and maximum required science packs determine where a technology can earliest be available and at which point it becomes infinite. The technology will never start at a lower level than is needed to unlock its first recipe. E.g., even if you set minimum to automation science, advanced circuit productivity will require logistic science as well, since the recipe is unlocked by a red-green technology.

The setting "One Planetary Science" means that the infinite level requires one of metallurgic, electromagnetic, agricultural or cryogenic science pack in addition to all lower packs. The pack is chosen based on the most prevalent recipe-type (e.g. smelting for metallurgic science). "Any Planetary Science" adds all packs that apply based on recipes (and may need multiple), but not necessarily all of them. "All Planetary Science" combines the four into one "level".

As is the case in the base game/Space Age, military and utility science can be ignored from producitivty technologies. They will still require these packs if the recipe-unlocking technology needs them (as is the strange case of coal-productivity, because coal synthesis is unlocked by rocket turrets).

Finally, "adjust existing productivity technologies to follow the same progression" does exactly that.


# FAQ

# I just want the same behavior as the Space Age, but with all intermediate recipes

Use default settings, change both "Minimum required science pack" and "Maximum required science pack" to "One Planetary Science" and remove the checkmark in "Adjust existing productivity technologies to follow the same progression?".

# Can I update the mod or change settings on an existing save?

Usually, you can update or change settings on an existing save. The exception is if you're currently researching one of the technologies this pack adds or modifies maximum level and have already researched more levels. In both cases I have no idea what will happen. :)
