-- Path of Building
--
-- Dexterity support gems
-- Skill gem data (c) Grinding Gear Games
--
local gems, mod, flag, skill = ...

gems["Added Cold Damage"] = {
	cold = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 1, 10, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 30), 
	},
	qualityMods = {
		mod("ColdDamage", "INC", 0.5), --"cold_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("ColdMin", "BASE", nil), --"global_minimum_added_cold_damage"
		[2] = mod("ColdMax", "BASE", nil), --"global_maximum_added_cold_damage"
	},
	levels = {
		[1] = { 4, 6, },
		[2] = { 5, 7, },
		[3] = { 6, 9, },
		[4] = { 8, 11, },
		[5] = { 10, 15, },
		[6] = { 13, 19, },
		[7] = { 16, 24, },
		[8] = { 20, 31, },
		[9] = { 25, 38, },
		[10] = { 30, 45, },
		[11] = { 35, 52, },
		[12] = { 40, 61, },
		[13] = { 47, 70, },
		[14] = { 54, 81, },
		[15] = { 63, 94, },
		[16] = { 72, 108, },
		[17] = { 83, 125, },
		[18] = { 95, 143, },
		[19] = { 109, 164, },
		[20] = { 125, 188, },
		[21] = { 137, 205, },
		[22] = { 149, 224, },
		[23] = { 163, 245, },
		[24] = { 178, 267, },
		[25] = { 194, 291, },
		[26] = { 212, 318, },
		[27] = { 231, 346, },
		[28] = { 251, 377, },
		[29] = { 274, 411, },
		[30] = { 298, 447, },
	},
}
gems["Additional Accuracy"] = {
	attack = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 1, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
	},
	qualityMods = {
		mod("Accuracy", "INC", 1, 0, 0, nil), --"accuracy_rating_+%" = 1
	},
	levelMods = {
		[1] = mod("Accuracy", "BASE", nil, 0, 0, nil), --"accuracy_rating"
	},
	levels = {
		[1] = { 74, },
		[2] = { 100, },
		[3] = { 127, },
		[4] = { 157, },
		[5] = { 190, },
		[6] = { 230, },
		[7] = { 290, },
		[8] = { 350, },
		[9] = { 400, },
		[10] = { 453, },
		[11] = { 528, },
		[12] = { 586, },
		[13] = { 645, },
		[14] = { 707, },
		[15] = { 772, },
		[16] = { 840, },
		[17] = { 887, },
		[18] = { 934, },
		[19] = { 983, },
		[20] = { 1034, },
		[21] = { 1085, },
		[22] = { 1138, },
		[23] = { 1191, },
		[24] = { 1246, },
		[25] = { 1301, },
		[26] = { 1358, },
		[27] = { 1415, },
		[28] = { 1474, },
		[29] = { 1533, },
		[30] = { 1594, },
	},
}
gems["Blind"] = {
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		--"global_chance_to_blind_on_hit_%" = 10
	},
	qualityMods = {
		--"blind_duration_+%" = 1
	},
	levelMods = {
		--[1] = "blind_duration_+%"
	},
	levels = {
		[1] = { 0, },
		[2] = { 2, },
		[3] = { 4, },
		[4] = { 6, },
		[5] = { 8, },
		[6] = { 10, },
		[7] = { 12, },
		[8] = { 14, },
		[9] = { 16, },
		[10] = { 18, },
		[11] = { 20, },
		[12] = { 22, },
		[13] = { 24, },
		[14] = { 26, },
		[15] = { 28, },
		[16] = { 30, },
		[17] = { 32, },
		[18] = { 34, },
		[19] = { 36, },
		[20] = { 38, },
		[21] = { 40, },
		[22] = { 42, },
		[23] = { 44, },
		[24] = { 46, },
		[25] = { 48, },
		[26] = { 50, },
		[27] = { 52, },
		[28] = { 54, },
		[29] = { 56, },
		[30] = { 58, },
	},
}
gems["Block Chance Reduction"] = {
	dexterity = true,
	support = true,
	unsupported = true,
}
gems["Cast On Critical Strike"] = {
	dexterity = true,
	support = true,
	spell = true,
	trigger = true,
	unsupported = true,
}
gems["Cast on Death"] = {
	dexterity = true,
	support = true,
	spell = true,
	trigger = true,
	color = 2,
	requireSkillTypes = { 36, },
	addSkillTypes = { 42, },
	excludeSkillTypes = { 9, 37, 41, 30, 44, },
	baseMods = {
		--"cast_on_death_%" = 100
		--"spell_uncastable_if_triggerable" = ?
		--"spell_only_castable_on_death" = ?
		skill("showAverage", true), --"base_skill_show_average_damage_instead_of_dps" = ?
	},
	qualityMods = {
		mod("AreaRadius", "INC", 3), --"area_of_effect_+%_while_dead" = 3
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil), --"cast_on_death_damage_+%_final_while_dead"
	},
	levels = {
		[1] = { 0, },
		[2] = { 16, },
		[3] = { 32, },
		[4] = { 48, },
		[5] = { 64, },
		[6] = { 80, },
		[7] = { 96, },
		[8] = { 112, },
		[9] = { 128, },
		[10] = { 144, },
		[11] = { 160, },
		[12] = { 176, },
		[13] = { 192, },
		[14] = { 208, },
		[15] = { 224, },
		[16] = { 240, },
		[17] = { 256, },
		[18] = { 272, },
		[19] = { 288, },
		[20] = { 304, },
		[21] = { 320, },
		[22] = { 336, },
		[23] = { 352, },
		[24] = { 368, },
		[25] = { 384, },
		[26] = { 400, },
		[27] = { 416, },
		[28] = { 432, },
		[29] = { 448, },
		[30] = { 464, },
	},
}
gems["Chain"] = {
	dexterity = true,
	support = true,
	chaining = true,
	projectile = true,
	color = 2,
	requireSkillTypes = { 23, 3, 54, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 50), 
		mod("ChainCount", "BASE", 2), --"number_of_additional_projectiles_in_chain" = 2
	},
	qualityMods = {
		mod("ProjectileSpeed", "INC", 1), --"base_projectile_speed_+%" = 1
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil), --"support_chain_damage_+%_final"
	},
	levels = {
		[1] = { -50, },
		[2] = { -49, },
		[3] = { -48, },
		[4] = { -47, },
		[5] = { -46, },
		[6] = { -45, },
		[7] = { -44, },
		[8] = { -43, },
		[9] = { -42, },
		[10] = { -41, },
		[11] = { -40, },
		[12] = { -39, },
		[13] = { -38, },
		[14] = { -37, },
		[15] = { -36, },
		[16] = { -35, },
		[17] = { -34, },
		[18] = { -33, },
		[19] = { -32, },
		[20] = { -31, },
		[21] = { -30, },
		[22] = { -29, },
		[23] = { -28, },
		[24] = { -27, },
		[25] = { -26, },
		[26] = { -25, },
		[27] = { -24, },
		[28] = { -23, },
		[29] = { -22, },
		[30] = { -21, },
	},
}
gems["Chance to Flee"] = {
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 1, 10, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
	},
	qualityMods = {
		--"global_hit_causes_monster_flee_%" = 1
	},
	levelMods = {
		--[1] = "global_hit_causes_monster_flee_%"
	},
	levels = {
		[1] = { 25, },
		[2] = { 26, },
		[3] = { 27, },
		[4] = { 28, },
		[5] = { 29, },
		[6] = { 30, },
		[7] = { 31, },
		[8] = { 32, },
		[9] = { 33, },
		[10] = { 34, },
		[11] = { 35, },
		[12] = { 36, },
		[13] = { 37, },
		[14] = { 38, },
		[15] = { 39, },
		[16] = { 40, },
		[17] = { 41, },
		[18] = { 42, },
		[19] = { 43, },
		[20] = { 44, },
		[21] = { 45, },
		[22] = { 46, },
		[23] = { 47, },
		[24] = { 48, },
		[25] = { 49, },
		[26] = { 50, },
		[27] = { 51, },
		[28] = { 52, },
		[29] = { 53, },
		[30] = { 54, },
	},
}
gems["Cluster Traps"] = {
	trap = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 37, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 50), 
		--"number_of_additional_traps_to_throw" = 3
		mod("ActiveTrapLimit", "BASE", 5), --"number_of_additional_traps_allowed" = 5
		--"throw_traps_in_circle_radius" = 20
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, 0, KeywordFlag.Trap), --"trap_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil), --"support_clustertrap_damage_+%_final"
	},
	levels = {
		[1] = { -55, },
		[2] = { -54, },
		[3] = { -53, },
		[4] = { -52, },
		[5] = { -51, },
		[6] = { -50, },
		[7] = { -49, },
		[8] = { -48, },
		[9] = { -47, },
		[10] = { -46, },
		[11] = { -45, },
		[12] = { -44, },
		[13] = { -43, },
		[14] = { -42, },
		[15] = { -41, },
		[16] = { -40, },
		[17] = { -39, },
		[18] = { -38, },
		[19] = { -37, },
		[20] = { -36, },
		[21] = { -35, },
		[22] = { -34, },
		[23] = { -33, },
		[24] = { -32, },
		[25] = { -31, },
		[26] = { -30, },
		[27] = { -29, },
		[28] = { -28, },
		[29] = { -27, },
		[30] = { -26, },
	},
}
gems["Cold Penetration"] = {
	cold = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 40), 
	},
	qualityMods = {
		mod("ColdDamage", "INC", 0.5), --"cold_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("ColdPenetration", "BASE", nil), --"base_reduce_enemy_cold_resistance_%"
	},
	levels = {
		[1] = { 18, },
		[2] = { 19, },
		[3] = { 20, },
		[4] = { 21, },
		[5] = { 22, },
		[6] = { 23, },
		[7] = { 24, },
		[8] = { 25, },
		[9] = { 26, },
		[10] = { 27, },
		[11] = { 28, },
		[12] = { 29, },
		[13] = { 30, },
		[14] = { 31, },
		[15] = { 32, },
		[16] = { 33, },
		[17] = { 34, },
		[18] = { 35, },
		[19] = { 36, },
		[20] = { 37, },
		[21] = { 38, },
		[22] = { 39, },
		[23] = { 40, },
		[24] = { 41, },
		[25] = { 42, },
		[26] = { 43, },
		[27] = { 44, },
		[28] = { 45, },
		[29] = { 46, },
		[30] = { 47, },
	},
}
gems["Culling Strike"] = {
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 10), 
		--"kill_enemy_on_hit_if_under_10%_life" = 1
		mod("Speed", "INC", 0, ModFlag.Attack, 0, nil), --"attack_speed_+%" = 0
		mod("Speed", "INC", 0, ModFlag.Spell), --"base_cast_speed_+%" = 0
	},
	qualityMods = {
		mod("Speed", "INC", 0.5, ModFlag.Attack, 0, nil), --"attack_speed_+%" = 0.5
		mod("Speed", "INC", 0.5, ModFlag.Spell), --"base_cast_speed_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "INC", nil, 0, 0, nil), --"damage_+%"
	},
	levels = {
		[1] = { 0, },
		[2] = { 2, },
		[3] = { 4, },
		[4] = { 6, },
		[5] = { 8, },
		[6] = { 10, },
		[7] = { 12, },
		[8] = { 14, },
		[9] = { 16, },
		[10] = { 18, },
		[11] = { 20, },
		[12] = { 22, },
		[13] = { 24, },
		[14] = { 26, },
		[15] = { 28, },
		[16] = { 30, },
		[17] = { 32, },
		[18] = { 34, },
		[19] = { 36, },
		[20] = { 38, },
		[21] = { 40, },
		[22] = { 42, },
		[23] = { 44, },
		[24] = { 46, },
		[25] = { 48, },
		[26] = { 50, },
		[27] = { 52, },
		[28] = { 54, },
		[29] = { 56, },
		[30] = { 58, },
	},
}
gems["Enhance"] = {
	low_max_level = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 15), 
	},
	qualityMods = {
		--"local_gem_experience_gain_+%" = 5
	},
	levelMods = {
		[1] = mod("GemProperty", "LIST", { keyword = "active", key = "quality", value = nil }), --"supported_active_skill_gem_quality_%"
	},
	levels = {
		[1] = { 0, },
		[2] = { 8, },
		[3] = { 16, },
		[4] = { 24, },
		[5] = { 32, },
		[6] = { 40, },
		[7] = { 48, },
		[8] = { 56, },
		[9] = { 64, },
		[10] = { 72, },
	},
}
gems["Faster Attacks"] = {
	attack = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 1, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 15), 
	},
	qualityMods = {
		mod("Speed", "INC", 0.5, ModFlag.Attack, 0, nil), --"attack_speed_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Speed", "INC", nil, ModFlag.Attack, 0, nil), --"attack_speed_+%"
	},
	levels = {
		[1] = { 25, },
		[2] = { 26, },
		[3] = { 27, },
		[4] = { 28, },
		[5] = { 29, },
		[6] = { 30, },
		[7] = { 31, },
		[8] = { 32, },
		[9] = { 33, },
		[10] = { 34, },
		[11] = { 35, },
		[12] = { 36, },
		[13] = { 37, },
		[14] = { 38, },
		[15] = { 39, },
		[16] = { 40, },
		[17] = { 41, },
		[18] = { 42, },
		[19] = { 43, },
		[20] = { 44, },
		[21] = { 45, },
		[22] = { 46, },
		[23] = { 47, },
		[24] = { 48, },
		[25] = { 49, },
		[26] = { 50, },
		[27] = { 51, },
		[28] = { 52, },
		[29] = { 53, },
		[30] = { 54, },
	},
}
gems["Faster Projectiles"] = {
	dexterity = true,
	support = true,
	projectile = true,
	color = 2,
	requireSkillTypes = { 3, 14, 54, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { 51, },
	baseMods = {
		mod("ManaCost", "MORE", 10), 
	},
	qualityMods = {
		mod("Speed", "INC", 0.5, ModFlag.Attack, 0, nil), --"attack_speed_+%" = 0.5
		mod("Speed", "INC", 0.5, ModFlag.Spell), --"base_cast_speed_+%" = 0.5
	},
	levelMods = {
		[1] = mod("ProjectileSpeed", "INC", nil), --"base_projectile_speed_+%"
		[2] = mod("Damage", "INC", nil, ModFlag.Projectile), --"projectile_damage_+%"
	},
	levels = {
		[1] = { 50, 20, },
		[2] = { 51, 20, },
		[3] = { 52, 21, },
		[4] = { 53, 21, },
		[5] = { 54, 22, },
		[6] = { 55, 22, },
		[7] = { 56, 23, },
		[8] = { 57, 23, },
		[9] = { 58, 24, },
		[10] = { 59, 24, },
		[11] = { 60, 25, },
		[12] = { 61, 25, },
		[13] = { 62, 26, },
		[14] = { 63, 26, },
		[15] = { 64, 27, },
		[16] = { 65, 27, },
		[17] = { 66, 28, },
		[18] = { 67, 28, },
		[19] = { 68, 29, },
		[20] = { 69, 29, },
		[21] = { 70, 30, },
		[22] = { 71, 30, },
		[23] = { 72, 31, },
		[24] = { 73, 31, },
		[25] = { 74, 32, },
		[26] = { 75, 32, },
		[27] = { 76, 33, },
		[28] = { 77, 33, },
		[29] = { 78, 34, },
		[30] = { 79, 34, },
	},
}
gems["Fork"] = {
	dexterity = true,
	support = true,
	projectile = true,
	color = 2,
	requireSkillTypes = { 3, 54, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 30), 
		--"projectiles_fork" = ?
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, ModFlag.Projectile), --"projectile_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, ModFlag.Projectile), --"support_fork_projectile_damage_+%_final"
	},
	levels = {
		[1] = { -30, },
		[2] = { -29, },
		[3] = { -28, },
		[4] = { -27, },
		[5] = { -26, },
		[6] = { -25, },
		[7] = { -24, },
		[8] = { -23, },
		[9] = { -22, },
		[10] = { -21, },
		[11] = { -20, },
		[12] = { -19, },
		[13] = { -18, },
		[14] = { -17, },
		[15] = { -16, },
		[16] = { -15, },
		[17] = { -14, },
		[18] = { -13, },
		[19] = { -12, },
		[20] = { -11, },
		[21] = { -10, },
		[22] = { -9, },
		[23] = { -8, },
		[24] = { -7, },
		[25] = { -6, },
		[26] = { -5, },
		[27] = { -4, },
		[28] = { -3, },
		[29] = { -2, },
		[30] = { -1, },
	},
}
gems["Greater Multiple Projectiles"] = {
	dexterity = true,
	support = true,
	projectile = true,
	color = 2,
	requireSkillTypes = { 3, 54, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 65), 
		mod("ProjectileCount", "BASE", 4), --"number_of_additional_projectiles" = 4
		mod("Damage", "INC", 0, ModFlag.Projectile), --"projectile_damage_+%" = 0
	},
	qualityMods = {
		mod("Speed", "INC", 0.5, ModFlag.Attack, 0, nil), --"attack_speed_+%" = 0.5
		mod("Speed", "INC", 0.5, ModFlag.Spell), --"base_cast_speed_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, ModFlag.Projectile), --"support_multiple_projectile_damage_+%_final"
	},
	levels = {
		[1] = { -35, },
		[2] = { -35, },
		[3] = { -34, },
		[4] = { -34, },
		[5] = { -33, },
		[6] = { -33, },
		[7] = { -32, },
		[8] = { -32, },
		[9] = { -31, },
		[10] = { -31, },
		[11] = { -30, },
		[12] = { -30, },
		[13] = { -29, },
		[14] = { -29, },
		[15] = { -28, },
		[16] = { -28, },
		[17] = { -27, },
		[18] = { -27, },
		[19] = { -26, },
		[20] = { -26, },
		[21] = { -25, },
		[22] = { -25, },
		[23] = { -24, },
		[24] = { -24, },
		[25] = { -23, },
		[26] = { -23, },
		[27] = { -22, },
		[28] = { -22, },
		[29] = { -21, },
		[30] = { -21, },
	},
}
gems["Hypothermia"] = {
	cold = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 20), 
		mod("EnemyFreezeChance", "BASE", 10, ModFlag.Hit, 0, { type = "Condition", var = "EnemyChilled" }), --"additional_chance_to_freeze_chilled_enemies_%" = 10
	},
	qualityMods = {
		mod("EnemyChillDuration", "INC", 1.5), --"chill_duration_+%" = 1.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, ModFlag.Hit, 0, { type = "Condition", var = "EnemyChilled" }), --"support_hypothermia_damage_+%_vs_chilled_enemies_final"
	},
	levels = {
		[1] = { 20, },
		[2] = { 21, },
		[3] = { 22, },
		[4] = { 23, },
		[5] = { 24, },
		[6] = { 25, },
		[7] = { 26, },
		[8] = { 27, },
		[9] = { 28, },
		[10] = { 29, },
		[11] = { 30, },
		[12] = { 31, },
		[13] = { 32, },
		[14] = { 33, },
		[15] = { 34, },
		[16] = { 35, },
		[17] = { 36, },
		[18] = { 37, },
		[19] = { 38, },
		[20] = { 39, },
		[21] = { 40, },
		[22] = { 41, },
		[23] = { 42, },
		[24] = { 43, },
		[25] = { 44, },
		[26] = { 45, },
		[27] = { 46, },
		[28] = { 47, },
		[29] = { 48, },
		[30] = { 49, },
	},
}
gems["Ice Bite"] = {
	cold = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 10), 
		mod("EnemyFreezeChance", "BASE", 15), --"base_chance_to_freeze_%" = 15
	},
	qualityMods = {
		mod("Damage", "INC", 1, ModFlag.Hit, 0, { type = "Condition", var = "EnemyFrozen" }), --"damage_+%_vs_frozen_enemies" = 1
	},
	levelMods = {
		--[1] = "chance_to_gain_frenzy_charge_on_killing_frozen_enemy_%"
	},
	levels = {
		[1] = { 50, },
		[2] = { 51, },
		[3] = { 52, },
		[4] = { 53, },
		[5] = { 54, },
		[6] = { 55, },
		[7] = { 56, },
		[8] = { 57, },
		[9] = { 58, },
		[10] = { 59, },
		[11] = { 60, },
		[12] = { 61, },
		[13] = { 62, },
		[14] = { 63, },
		[15] = { 64, },
		[16] = { 65, },
		[17] = { 66, },
		[18] = { 67, },
		[19] = { 68, },
		[20] = { 69, },
		[21] = { 70, },
		[22] = { 71, },
		[23] = { 72, },
		[24] = { 73, },
		[25] = { 74, },
		[26] = { 75, },
		[27] = { 76, },
		[28] = { 77, },
		[29] = { 78, },
		[30] = { 79, },
	},
}
gems["Lesser Multiple Projectiles"] = {
	dexterity = true,
	support = true,
	projectile = true,
	color = 2,
	requireSkillTypes = { 3, 54, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 40), 
		mod("ProjectileCount", "BASE", 2), --"number_of_additional_projectiles" = 2
		mod("Damage", "INC", 0, ModFlag.Projectile), --"projectile_damage_+%" = 0
	},
	qualityMods = {
		mod("Speed", "INC", 0.5, ModFlag.Attack, 0, nil), --"attack_speed_+%" = 0.5
		mod("Speed", "INC", 0.5, ModFlag.Spell), --"base_cast_speed_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, ModFlag.Projectile), --"support_lesser_multiple_projectile_damage_+%_final"
	},
	levels = {
		[1] = { -25, },
		[2] = { -25, },
		[3] = { -24, },
		[4] = { -24, },
		[5] = { -23, },
		[6] = { -23, },
		[7] = { -22, },
		[8] = { -22, },
		[9] = { -21, },
		[10] = { -21, },
		[11] = { -20, },
		[12] = { -20, },
		[13] = { -19, },
		[14] = { -19, },
		[15] = { -18, },
		[16] = { -18, },
		[17] = { -17, },
		[18] = { -17, },
		[19] = { -16, },
		[20] = { -16, },
		[21] = { -15, },
		[22] = { -15, },
		[23] = { -14, },
		[24] = { -14, },
		[25] = { -13, },
		[26] = { -13, },
		[27] = { -12, },
		[28] = { -12, },
		[29] = { -11, },
		[30] = { -11, },
	},
}
gems["Mana Leech"] = {
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		--"mana_leech_from_any_damage_permyriad" = 200
	},
	qualityMods = {
		--"mana_leech_speed_+%" = 0.5
	},
	levelMods = {
		--[1] = "mana_leech_speed_+%"
	},
	levels = {
		[1] = { 0, },
		[2] = { 2, },
		[3] = { 4, },
		[4] = { 6, },
		[5] = { 8, },
		[6] = { 10, },
		[7] = { 12, },
		[8] = { 14, },
		[9] = { 16, },
		[10] = { 18, },
		[11] = { 20, },
		[12] = { 22, },
		[13] = { 24, },
		[14] = { 26, },
		[15] = { 28, },
		[16] = { 30, },
		[17] = { 32, },
		[18] = { 34, },
		[19] = { 36, },
		[20] = { 38, },
		[21] = { 40, },
		[22] = { 42, },
		[23] = { 44, },
		[24] = { 46, },
		[25] = { 48, },
		[26] = { 50, },
		[27] = { 52, },
		[28] = { 54, },
		[29] = { 56, },
		[30] = { 58, },
	},
}
gems["Multiple Traps"] = {
	dexterity = true,
	support = true,
	trap = true,
	color = 2,
	requireSkillTypes = { 37, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 60), 
		--"number_of_additional_traps_to_throw" = 2
		mod("ActiveTrapLimit", "BASE", 3), --"number_of_additional_traps_allowed" = 3
	},
	qualityMods = {
		mod("TrapTriggerRadius", "INC", 1), --"trap_trigger_radius_+%" = 1
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil), --"support_multithrow_damage_+%_final"
	},
	levels = {
		[1] = { -40, },
		[2] = { -39, },
		[3] = { -38, },
		[4] = { -37, },
		[5] = { -36, },
		[6] = { -35, },
		[7] = { -34, },
		[8] = { -33, },
		[9] = { -32, },
		[10] = { -31, },
		[11] = { -30, },
		[12] = { -29, },
		[13] = { -28, },
		[14] = { -27, },
		[15] = { -26, },
		[16] = { -25, },
		[17] = { -24, },
		[18] = { -23, },
		[19] = { -22, },
		[20] = { -21, },
		[21] = { -20, },
		[22] = { -19, },
		[23] = { -18, },
		[24] = { -17, },
		[25] = { -16, },
		[26] = { -15, },
		[27] = { -14, },
		[28] = { -13, },
		[29] = { -12, },
		[30] = { -11, },
	},
}
gems["Physical Projectile Attack Damage"] = {
	projectile = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 48, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 20), 
		mod("Speed", "MORE", -10, bit.bor(ModFlag.Attack, ModFlag.Projectile)), --"support_projectile_attack_speed_+%_final" = -10
	},
	qualityMods = {
		mod("PhysicalDamage", "INC", 0.5), --"physical_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("PhysicalDamage", "MORE", nil, bit.bor(ModFlag.Attack, ModFlag.Projectile)), --"support_projectile_attack_physical_damage_+%_final"
	},
	levels = {
		[1] = { 30, },
		[2] = { 31, },
		[3] = { 32, },
		[4] = { 33, },
		[5] = { 34, },
		[6] = { 35, },
		[7] = { 36, },
		[8] = { 37, },
		[9] = { 38, },
		[10] = { 39, },
		[11] = { 40, },
		[12] = { 41, },
		[13] = { 42, },
		[14] = { 43, },
		[15] = { 44, },
		[16] = { 45, },
		[17] = { 46, },
		[18] = { 47, },
		[19] = { 48, },
		[20] = { 49, },
		[21] = { 50, },
		[22] = { 51, },
		[23] = { 52, },
		[24] = { 53, },
		[25] = { 54, },
		[26] = { 55, },
		[27] = { 56, },
		[28] = { 57, },
		[29] = { 58, },
		[30] = { 59, },
	},
}
gems["Pierce"] = {
	dexterity = true,
	support = true,
	projectile = true,
	color = 2,
	requireSkillTypes = { 3, 54, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 30), 
		mod("PierceChance", "BASE", 50), --"pierce_%" = 50
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, ModFlag.Projectile), --"projectile_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, ModFlag.Projectile), --"support_pierce_projectile_damage_+%_final"
	},
	levels = {
		[1] = { 10, },
		[2] = { 10, },
		[3] = { 11, },
		[4] = { 11, },
		[5] = { 12, },
		[6] = { 12, },
		[7] = { 13, },
		[8] = { 13, },
		[9] = { 14, },
		[10] = { 14, },
		[11] = { 15, },
		[12] = { 15, },
		[13] = { 16, },
		[14] = { 16, },
		[15] = { 17, },
		[16] = { 17, },
		[17] = { 18, },
		[18] = { 18, },
		[19] = { 19, },
		[20] = { 19, },
		[21] = { 20, },
		[22] = { 20, },
		[23] = { 21, },
		[24] = { 21, },
		[25] = { 22, },
		[26] = { 22, },
		[27] = { 23, },
		[28] = { 23, },
		[29] = { 24, },
		[30] = { 24, },
	},
}
gems["Point Blank"] = {
	projectile = true,
	attack = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 48, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 20), 
		--"keystone_point_blank" = 1
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, ModFlag.Projectile), --"projectile_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "INC", nil, ModFlag.Projectile), --"projectile_damage_+%"
	},
	levels = {
		[1] = { 0, },
		[2] = { 2, },
		[3] = { 4, },
		[4] = { 6, },
		[5] = { 8, },
		[6] = { 10, },
		[7] = { 12, },
		[8] = { 14, },
		[9] = { 16, },
		[10] = { 18, },
		[11] = { 20, },
		[12] = { 22, },
		[13] = { 24, },
		[14] = { 26, },
		[15] = { 28, },
		[16] = { 30, },
		[17] = { 32, },
		[18] = { 34, },
		[19] = { 36, },
		[20] = { 38, },
		[21] = { 40, },
		[22] = { 42, },
		[23] = { 44, },
		[24] = { 46, },
		[25] = { 48, },
		[26] = { 50, },
		[27] = { 52, },
		[28] = { 54, },
		[29] = { 56, },
		[30] = { 58, },
	},
}
gems["Poison"] = {
	chaos = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 35), 
		mod("PoisonChance", "BASE", 100), --"global_poison_on_hit" = ?
	},
	qualityMods = {
		mod("Duration", "INC", 0.5, 0, KeywordFlag.Poison), --"base_poison_duration_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "INC", nil, 0, KeywordFlag.Poison), --"base_poison_damage_+%"
	},
	levels = {
		[1] = { 0, },
		[2] = { 2, },
		[3] = { 4, },
		[4] = { 6, },
		[5] = { 8, },
		[6] = { 10, },
		[7] = { 12, },
		[8] = { 14, },
		[9] = { 16, },
		[10] = { 18, },
		[11] = { 20, },
		[12] = { 22, },
		[13] = { 24, },
		[14] = { 26, },
		[15] = { 28, },
		[16] = { 30, },
		[17] = { 32, },
		[18] = { 34, },
		[19] = { 36, },
		[20] = { 38, },
		[21] = { 40, },
		[22] = { 42, },
		[23] = { 44, },
		[24] = { 46, },
		[25] = { 48, },
		[26] = { 50, },
		[27] = { 52, },
		[28] = { 54, },
		[29] = { 56, },
		[30] = { 58, },
	},
}
gems["Rapid Decay"] = {
	dexterity = true,
	support = true,
	duration = true,
	color = 2,
	requireSkillTypes = { 12, 55, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 25), 
		mod("Duration", "INC", -15), --"skill_effect_duration_+%" = -15
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, ModFlag.Dot), --"damage_over_time_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, ModFlag.Dot), --"support_rapid_decay_damage_over_time_+%_final"
	},
	levels = {
		[1] = { 20, },
		[2] = { 21, },
		[3] = { 22, },
		[4] = { 23, },
		[5] = { 24, },
		[6] = { 25, },
		[7] = { 26, },
		[8] = { 27, },
		[9] = { 28, },
		[10] = { 29, },
		[11] = { 30, },
		[12] = { 31, },
		[13] = { 32, },
		[14] = { 33, },
		[15] = { 34, },
		[16] = { 35, },
		[17] = { 36, },
		[18] = { 37, },
		[19] = { 38, },
		[20] = { 39, },
		[21] = { 40, },
		[22] = { 41, },
		[23] = { 42, },
		[24] = { 43, },
		[25] = { 44, },
		[26] = { 45, },
		[27] = { 46, },
		[28] = { 47, },
		[29] = { 48, },
		[30] = { 49, },
	},
}
gems["Slower Projectiles"] = {
	dexterity = true,
	support = true,
	projectile = true,
	color = 2,
	requireSkillTypes = { 3, 14, 54, 56, },
	addSkillTypes = { },
	excludeSkillTypes = { 51, },
	baseMods = {
		mod("ManaCost", "MORE", 40), 
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, ModFlag.Projectile), --"projectile_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("ProjectileSpeed", "MORE", nil), --"support_slower_projectiles_projectile_speed_+%_final"
		[2] = mod("Damage", "MORE", nil, ModFlag.Projectile), --"support_slower_projectiles_damage_+%_final"
	},
	levels = {
		[1] = { -30, 20, },
		[2] = { -31, 20, },
		[3] = { -32, 21, },
		[4] = { -33, 21, },
		[5] = { -34, 22, },
		[6] = { -35, 22, },
		[7] = { -36, 23, },
		[8] = { -37, 23, },
		[9] = { -38, 24, },
		[10] = { -39, 24, },
		[11] = { -40, 25, },
		[12] = { -41, 25, },
		[13] = { -42, 26, },
		[14] = { -43, 26, },
		[15] = { -44, 27, },
		[16] = { -45, 27, },
		[17] = { -46, 28, },
		[18] = { -47, 28, },
		[19] = { -48, 29, },
		[20] = { -49, 29, },
		[21] = { -50, 30, },
		[22] = { -51, 30, },
		[23] = { -52, 31, },
		[24] = { -53, 31, },
		[25] = { -54, 32, },
		[26] = { -55, 32, },
		[27] = { -56, 33, },
		[28] = { -57, 33, },
		[29] = { -58, 34, },
		[30] = { -59, 34, },
	},
}
gems["Trap"] = {
	dexterity = true,
	support = true,
	trap = true,
	duration = true,
	addFlags = {
		trap = true,
		duration = true,
	},
	color = 2,
	requireSkillTypes = { 17, },
	addSkillTypes = { 12, 37, },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 40), 
		--"is_trap" = 1
		--"base_trap_duration" = 16000
		--"trap_override_pvp_scaling_time_ms" = 900
		--"base_skill_is_trapped" = ?
		--"disable_skill_if_melee_attack" = ?
		skill("showAverage", true), --"base_skill_show_average_damage_instead_of_dps" = ?
		skill("trapCooldown", 4), 
	},
	qualityMods = {
		mod("TrapThrowingSpeed", "INC", 0.5), --"trap_throwing_speed_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, ModFlag.Hit, KeywordFlag.Trap), --"support_trap_hit_damage_+%_final"
	},
	levels = {
		[1] = { 20, },
		[2] = { 21, },
		[3] = { 22, },
		[4] = { 23, },
		[5] = { 24, },
		[6] = { 25, },
		[7] = { 26, },
		[8] = { 27, },
		[9] = { 28, },
		[10] = { 29, },
		[11] = { 30, },
		[12] = { 31, },
		[13] = { 32, },
		[14] = { 33, },
		[15] = { 34, },
		[16] = { 35, },
		[17] = { 36, },
		[18] = { 37, },
		[19] = { 38, },
		[20] = { 39, },
		[21] = { 40, },
		[22] = { 41, },
		[23] = { 42, },
		[24] = { 43, },
		[25] = { 44, },
		[26] = { 45, },
		[27] = { 46, },
		[28] = { 47, },
		[29] = { 48, },
		[30] = { 49, },
	},
}
gems["Trap Cooldown"] = {
	trap = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 37, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 10), 
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, 0, KeywordFlag.Trap), --"trap_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("TrapCooldownRecovery", "INC", nil), --"placing_traps_cooldown_recovery_+%"
	},
	levels = {
		[1] = { 30, },
		[2] = { 31, },
		[3] = { 32, },
		[4] = { 33, },
		[5] = { 34, },
		[6] = { 35, },
		[7] = { 36, },
		[8] = { 37, },
		[9] = { 38, },
		[10] = { 39, },
		[11] = { 40, },
		[12] = { 41, },
		[13] = { 42, },
		[14] = { 43, },
		[15] = { 44, },
		[16] = { 45, },
		[17] = { 46, },
		[18] = { 47, },
		[19] = { 48, },
		[20] = { 49, },
		[21] = { 50, },
		[22] = { 51, },
		[23] = { 52, },
		[24] = { 53, },
		[25] = { 54, },
		[26] = { 55, },
		[27] = { 56, },
		[28] = { 57, },
		[29] = { 58, },
		[30] = { 59, },
	},
}
gems["Trap and Mine Damage"] = {
	dexterity = true,
	support = true,
	trap = true,
	mine = true,
	color = 2,
	requireSkillTypes = { 37, 41, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 30), 
		mod("TrapThrowingSpeed", "INC", -10), --"trap_throwing_speed_+%" = -10
		mod("MineLayingSpeed", "MORE", -10), --"mine_laying_speed_+%" = -10
	},
	qualityMods = {
		mod("Damage", "INC", 0.5, 0, 0, nil), --"damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("Damage", "MORE", nil, 0, bit.bor(KeywordFlag.Trap, KeywordFlag.Mine)), --"support_trap_and_mine_damage_+%_final"
	},
	levels = {
		[1] = { 20, },
		[2] = { 21, },
		[3] = { 22, },
		[4] = { 23, },
		[5] = { 24, },
		[6] = { 25, },
		[7] = { 26, },
		[8] = { 27, },
		[9] = { 28, },
		[10] = { 29, },
		[11] = { 30, },
		[12] = { 31, },
		[13] = { 32, },
		[14] = { 33, },
		[15] = { 34, },
		[16] = { 35, },
		[17] = { 36, },
		[18] = { 37, },
		[19] = { 38, },
		[20] = { 39, },
		[21] = { 40, },
		[22] = { 41, },
		[23] = { 42, },
		[24] = { 43, },
		[25] = { 44, },
		[26] = { 45, },
		[27] = { 46, },
		[28] = { 47, },
		[29] = { 48, },
		[30] = { 49, },
	},
}
gems["Void Manipulation"] = {
	chaos = true,
	dexterity = true,
	support = true,
	color = 2,
	requireSkillTypes = { 10, 1, 40, },
	addSkillTypes = { },
	excludeSkillTypes = { },
	baseMods = {
		mod("ManaCost", "MORE", 20), 
		mod("ElementalDamage", "INC", -25), --"elemental_damage_+%" = -25
	},
	qualityMods = {
		mod("ChaosDamage", "INC", 0.5), --"chaos_damage_+%" = 0.5
	},
	levelMods = {
		[1] = mod("ChaosDamage", "MORE", nil), --"support_void_manipulation_chaos_damage_+%_final"
	},
	levels = {
		[1] = { 20, },
		[2] = { 21, },
		[3] = { 22, },
		[4] = { 23, },
		[5] = { 24, },
		[6] = { 25, },
		[7] = { 26, },
		[8] = { 27, },
		[9] = { 28, },
		[10] = { 29, },
		[11] = { 30, },
		[12] = { 31, },
		[13] = { 32, },
		[14] = { 33, },
		[15] = { 34, },
		[16] = { 35, },
		[17] = { 36, },
		[18] = { 37, },
		[19] = { 38, },
		[20] = { 39, },
		[21] = { 40, },
		[22] = { 41, },
		[23] = { 42, },
		[24] = { 43, },
		[25] = { 44, },
		[26] = { 45, },
		[27] = { 46, },
		[28] = { 47, },
		[29] = { 48, },
		[30] = { 49, },
	},
}
