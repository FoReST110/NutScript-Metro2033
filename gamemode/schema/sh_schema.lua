SCHEMA.name = "Metro 2033"
SCHEMA.author = "Night"
SCHEMA.desc = "An roleplay schema based in the Metro universe."
SCHEMA.uniqueID = "metro" -- Schema will be a unique identifier stored in the database.
-- Using a uniqueID will allow for renaming the schema folder.

-- Configure some stuff specific to this schema.
nut.currency.SetUp("bullet", "bullets")
nut.config.menuMusic = ""
nut.config.mainColor = Color(247, 168, 64)
nut.config.dateStartMonth = 6
nut.config.dateStartDay = 12
nut.config.dateStartYear = 2033

nut.util.Include("sv_hooks.lua")
nut.util.Include("cl_hooks.lua")