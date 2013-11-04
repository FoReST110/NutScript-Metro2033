-- Give the faction a proper name for misc. use (such as the scoreboard)
FACTION.name = "Survivor"
-- Give a uniqueID that is used to identify a character in the database.
FACTION.uniqueID = "civ"
-- A short description used as a tooltip for character creation.
FACTION.desc = "Those that are left to dwell in the grim horrors of the metro."
-- Give the faction a color visible in the scoreboard and OOC.
FACTION.color = Color(20, 150, 15)
-- Empty the male models so they will not use default male models.
FACTION.maleModels = {}
-- Empty the female models so they will not use default female models.
FACTION.femaleModels = {}

-- Loop through the many citizen groups for wasteland citizens.
for i = 34, 36 do
		-- Loop through the 9 male variants.
		for i2 = 1, 9 do
				-- Add the male model to the faction's male model list.
				FACTION.maleModels[#FACTION.maleModels + 1] = Model("models/humans/group"..i.."/male_0"..i2..".mdl")
		end

		-- Loop through the 7 female variants.
		for i2 = 1, 7 do
			if i2 != 5 then
				-- Add the female model to the faction's female model list.
				FACTION.femaleModels[#FACTION.femaleModels + 1] = Model("models/humans/group"..i.."/female_0"..i2..".mdl")
			end
		end
end

-- Set a global variable that represents the team ID.
FACTION_CITIZEN = FACTION.index