# Expanded Productivity Research

This mod adds technologies for increasing the productivity of all intermediate recipes, similar to other mods like [Productivity Research For Everyone](https://mods.factorio.com/mod/ProductivityResearchForEveryone). Where it differs, however, is that it groups recipes that produce the same item into one technology. For example, you will get one technology for increasing the productivity of all solid fuel recipes instead of four separate ones. This is especially useful in combination with mods like [Vanilla Galore](https://mods.factorio.com/mod/vanilla_galore_continued) or [Space Age Galore](https://mods.factorio.com/mod/space_age_galore).

Additionally, research is staggered. Similar to how mining productivity, you can unlock the first level of productivity as soon as one recipe is unlocked and it only requires automation and logistic science packs. The next level adds chemical science packs, then purple science packs and so on until the final level which is infinite and repeatable. Pre-existing productivity technologies are adjusted to follow the same logic (can be deactivated).

Lastly, the progression is completely configurable and is, by default, different for science pack recipes.

# Version 1.1

With version 1.1 I added functionality to allow more productivity techs than just for intermediate recipes and the ability to overwrite my internal blacklist of recipes/items. This can be configured in the settings. For example, techs could be generated for intermediates and ammunition recipes and module recipes. Or you allow everything and then manually specifiy a long list of exceptions. Also, the mod groups some non-intermediate recipes into one tech, e.g. all types or magazines and shotgun, or all modules of one type. Feedback is appreciated.

# Mod compatibility

The generation of technologies is dynamic and should be flexible enough to be compatible with most mods right out of the gate. However, other mods might need to be flagged as optional dependencies if they add/change recipes in the final phase of initialization.

Where the mod will struggle is for recipes with multiple "main" products or where the "main" product is not the first result. Additionally, mods that remove science packs will most likely break the progression.

New science packs or lab types will be ignored by default.

## Fully compatible mods
- [Age of Production](https://mods.factorio.com/mod/Age-of-Production)
- [Vanilla Galore Continued](https://mods.factorio.com/mod/vanilla_galore_continued)
- [Space Age Galore](https://mods.factorio.com/mod/space_age_galore)
- [Various 5dim mods](https://mods.factorio.com/user/McGuten)

## Partial compatibility (i.e., works, but does not make full use of all features) or to be checked
- [Secretas & Frozeta](https://mods.factorio.com/mod/secretas)
- [Moshine](https://mods.factorio.com/mod/Moshine)
- [Muluna, Moon of Nauvis](https://mods.factorio.com/mod/planet-muluna)
- [Cerys](https://mods.factorio.com/mod/Cerys-Moon-of-Fulgora)
- [Space Age without Space](https://mods.factorio.com/mod/SpaceAgeWithoutSpace) (runs without issues, but the mod makes space science the highest pack again which makes the progression weird)

## Incompatible
- none known

# How it works
The mod scans all existing recipes that allow productivity and picks the first item as the main product. For each distinct main product, a series of technologies is created which increases the productivity of all recipes with that "main" product.

The first level of the technology requires the "lowest" technology that unlocks at least one of these recipes and requires the same science packs. The next level adds a new science pack and so on, until the full array of science packs required is complete, at which point the technology becomes infinite.

For example, *heavy oil* is the first result of *advanced oil processing*, *coal liquefaction* and *simple coal liquefaction*. The first level is unlocked right after *advanced oil processing* and requires automation, logistic and chemical science (default configuration). The next levels add production science, space science and finally agricultural science.

With version 1.1 I added settings to also consider some or all non-intermediate recipes. They work just like the intermediate recipe, except that some are grouped together, like all assembling machines being affected by one single tech, rather than one for each machine. This is done according to personal preference and how useful I consider the items. For example, you usually craft each armor type only once, so I see little reason to have productivity on these recipes. But if you do, one tech for light armor productivity, one for heavy armor, and so on, seems excessive to me.

# How to configure
There are two sets of settings, one for "regular" intermediates and one for science pack recipes. Both work analogous and can be set to the same values for a uniform progression.

The cost factor and cost base determine the research cost formula, which is FACTOR ^ level * BASE. The default is 1.5 and 1000 which matches the Space Age techs (1500, 2250, 3375, etc.).

The non-infinite levels require a fraction based on how many levels there are and rounded down to a multiple of 100. E.g., processing unit productivity has four levels (chemical, +production, +space, +electromagnetic). The first level costs 1/4 * 1500 = 375, which is rounded down to 300.

Infinite tech and maximum level can be used to limit the maximum available technology level, since productivity is capped at 300% (barring other mods that change this). Or if you simply prefer to have a custom limit on the productivity gained by this mod.

Minimum and maximum required science packs determine where a technology can earliest be available and at which point it becomes infinite. The technology will never start at a lower level than is needed to unlock its first recipe. E.g., even if you set minimum to automation science, advanced circuit productivity will require logistic science as well, since the recipe is unlocked by a red-green technology.

The setting "One Planetary Science" means that the infinite level requires one of metallurgic, electromagnetic, agricultural or cryogenic science pack in addition to all lower packs. The pack is chosen based on the most prevalent recipe-type (e.g. smelting for metallurgic science). "Any Planetary Science" adds all packs that apply based on recipes (and may need multiple), but not necessarily all of them. "All Planetary Science" combines the four into one "level".

As is the case in the base game/Space Age, military and utility science can be ignored from producitivty technologies. They will still require these packs if the recipe-unlocking technology needs them (as is the strange case of coal-productivity, because coal synthesis is unlocked by rocket turrets).

Next, "adjust existing productivity technologies to follow the same progression" does exactly that.

Internally, I exclude some items and recipes from generating techs, e.g., water, steam or the various circuit combinators. You can overwrite this setting by checking "Overwrite blacklist settings?" and provide your own, comma-separated list of items and recipes to be excluded.

Lastly, you can specify which recipes will be considered by the mod. By default, only intermediates (i.e., all recipes that allow for productivity modules) are considered, but you can additionally include recipes for ammo, modules or tiles (landfill, concrete, etc.) or even the full list of recipes.


# FAQ

# I just want the same behavior as the Space Age, but with all intermediate recipes

Use default settings, change both "Minimum required science pack" and "Maximum required science pack" to "One Planetary Science" and remove the checkmark in "Adjust existing productivity technologies to follow the same progression?".

# Can I update the mod or change settings on an existing save?

Usually, you can update or change settings on an existing save. The exception is if you're currently researching one of the technologies this pack adds or modifies maximum level and have already researched more levels. In both cases I have no idea what will happen. :)

# I encountered an error/I have a suggestion or new idea/Can you add compatibility to X?

Feel free to open a thread on [the mod portal](https://mods.factorio.com/mod/ExpandedProductivityResearch/discussion) or an issue on [github](https://github.com/Gandave/Expanded-Productivity-Research/issues). Please include a list of active mods (or your mod-list.json) and settings if they differ from default.

I try to fix bugs and add optional dependencies as quickly as possible. If it's a major idea or full compatibility with a mod that usually requires more time.
