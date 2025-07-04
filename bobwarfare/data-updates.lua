require("prototypes.overides")
require("prototypes.recipe.recipe-updates")
require("prototypes.technology.technology-updates")

require("prototypes.armor-updates")
require("prototypes.robots-updates")
require("prototypes.train-updates")
require("prototypes.recipe.drone-updates")
require("prototypes.spidertron-updates")

if settings.startup["bobmods-warfare-drainlesslaserturrets"].value == true then
  for index, turret in pairs(data.raw["electric-turret"]) do
    turret.energy_source.drain = "0W"
  end
end

if settings.startup["bobmods-warfare-vehicleflamethrowerstartsfires"].value == true then
  data.raw.ammo["flamethrower-ammo"].ammo_type = {
    {
      category = "flamethrower",
      clamp_position = true,
      source_type = "default",
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "stream",
          stream = "handheld-flamethrower-fire-stream",
        },
      },
    },
    {
      category = "flamethrower",
      clamp_position = true,
      source_type = "vehicle",
      target_type = "position",
      consumption_modifier = 1.125,
      action = {
        type = "direct",
        action_delivery = {
          type = "stream",
          stream = "flamethrower-fire-stream",
        },
      },
    },
  }
end

if mods["space-age"] then
  for _, spacerock in pairs(data.raw.asteroid) do
    local has_acid = false
    local has_poison = false
    for _, resist in pairs(spacerock.resistances) do
      if resist.type == "acid" then
        has_acid = true
      end
      if resist.type == "poison" then
        has_poison = true
      end
    end
    if has_acid == false then
      table.insert(spacerock.resistances, { type = "acid", percent = 99 })
    end
    if has_poison == false then
      table.insert(spacerock.resistances, { type = "poison", percent = 100 })
    end
  end
end

if mods["quality"] then
  bobmods.lib.recipe.update_recycling_recipe({
    "modular-armor",
    "power-armor",
    "power-armor-mk2",
    "bob-power-armor-mk3",
    "bob-power-armor-mk4",
    "bob-power-armor-mk5",
    "bob-rifle",
    "bob-sniper-rifle",
    "bob-laser-rifle",
    "tank",
    "bob-tank-2",
    "bob-tank-3",
    "artillery-wagon",
    "bob-artillery-wagon-2",
    "bob-artillery-wagon-3",
    "bob-robot-drone-frame",
    "bob-robot-drone-frame-large",
    "bob-robot-gun-drone",
    "bob-robot-laser-drone",
    "bob-robot-flamethrower-drone",
    "bob-robot-plasma-drone",
    "bob-bullet-casing",
    "bob-bullet-projectile",
    "bob-ap-bullet-projectile",
    "bob-he-bullet-projectile",
    "bob-flame-bullet-projectile",
    "bob-acid-bullet-projectile",
    "bob-poison-bullet-projectile",
    "bob-electric-bullet-projectile",
    "bob-uranium-bullet-projectile",
    "bob-plasma-bullet-projectile",
    "bob-shotgun-shell-casing",
    "bob-shot",
    "bob-rocket-engine",
    "bob-rocket-body",
    "bob-piercing-rocket-warhead",
    "bob-electric-rocket-warhead",
    "bob-explosive-rocket-warhead",
    "bob-acid-rocket-warhead",
    "bob-flame-rocket-warhead",
    "bob-poison-rocket-warhead",
    "bob-plasma-rocket-warhead",
    "bob-shotgun-ap-shell",
    "bob-shotgun-electric-shell",
    "bob-shotgun-explosive-shell",
    "bob-shotgun-flame-shell",
    "bob-shotgun-acid-shell",
    "bob-shotgun-poison-shell",
    "bob-shotgun-plasma-shell",
    "bob-laser-rifle-battery",
    "bob-laser-rifle-battery-ruby",
    "bob-laser-rifle-battery-sapphire",
    "bob-laser-rifle-battery-emerald",
    "bob-laser-rifle-battery-amethyst",
    "bob-laser-rifle-battery-topaz",
    "bob-laser-rifle-battery-diamond",
    "artillery-shell",
    "bob-poison-artillery-shell",
    "bob-fire-artillery-shell",
    "bob-explosive-artillery-shell",
    "bob-distractor-artillery-shell",
    "radar",
    "bob-radar-2",
    "bob-radar-3",
    "bob-radar-4",
    "bob-radar-5",
    "bob-gun-turret-2",
    "bob-gun-turret-3",
    "bob-gun-turret-4",
    "bob-gun-turret-5",
    "bob-sniper-turret-2",
    "bob-sniper-turret-3",
    "bob-laser-turret-2",
    "bob-laser-turret-3",
    "bob-laser-turret-4",
    "bob-laser-turret-5",
    "bob-plasma-turret-1",
    "bob-plasma-turret-2",
    "bob-plasma-turret-3",
    "bob-plasma-turret-4",
    "bob-artillery-turret-2",
    "bob-artillery-turret-3",
    "bob-robot-brain-combat",
    "bob-robot-brain-combat-2",
    "bob-robot-brain-combat-3",
    "bob-robot-brain-combat-4",
    "bob-robot-tool-combat",
    "bob-robot-tool-combat-2",
    "bob-robot-tool-combat-3",
    "bob-robot-tool-combat-4",
    "bob-defender-robot",
    "bob-distractor-robot",
    "bob-destroyer-robot",
    "bob-laser-robot",
    "defender-capsule",
    "distractor-capsule",
    "destroyer-capsule",
    "bob-mech-leg-segment",
    "bob-mech-foot",
    "bob-mech-hip",
    "bob-mech-knee",
    "bob-mech-leg",
    "bob-mech-brain",
    "bob-mech-armor-plate",
    "bob-antron",
    "bob-tankotron",
    "spidertron",
    "bob-logistic-spidertron",
    "bob-heavy-spidertron",
  })
end
