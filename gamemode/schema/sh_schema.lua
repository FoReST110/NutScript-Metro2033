SCHEMA.name = "Metro 2033"
SCHEMA.author = "Night"
SCHEMA.desc = "An roleplay schema based in the Metro universe."
SCHEMA.uniqueID = "metro" -- Schema will be a unique identifier stored in the database.
-- Using a uniqueID will allow for renaming the schema folder.

-- Configure some stuff specific to this schema.
nut.currency.SetUp("bullet", "bullets")
nut.config.menuMusic = ""

nut.util.Include("sv_hooks.lua")