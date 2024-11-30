require("graphics")
local item_sounds = require("__base__.prototypes.item_sounds")

local accumulator_prototype = table.deepcopy(data.raw["accumulator"])
accumulator_prototype.type = "accumulator"
accumulator_prototype.name = "accumulator-mk2"
accumulator_prototype.icon = "__accumulator-mk2__/graphics/icons/accumulator-mk2.png"
accumulator_prototype.minable = {mining_time = 0.1, result = "accumulator-mk2"}
accumulator_prototype.flags = {"placeable-neutral", "player-creation"}
accumulator_prototype.fast_replaceable_group = "accumulator"
accumulator_prototype.drawing_box_vertical_extension = 0.5
accumulator_prototype.corpse = "accumulator-remnants"
accumulator_prototype.dying_explosion = "accumulator-explosion"
accumulator_prototype.max_health = 200
accumulator_prototype.collision_box = {{-0.9, -0.9}, {0.9, 0.9}}
accumulator_prototype.selection_box = {{-1, -1}, {1, 1}}
accumulator_prototype.energy_source =
{
  type = "electric",
  buffer_capacity = "50MJ",
  usage_priority = "tertiary",
  input_flow_limit = "900kW",
  output_flow_limit = "900kW"
}
accumulator_prototype.chargable_graphics =
{
  picture = accumulator_mk2_picture(),
  charge_animation = accumulator_mk2_charge(),
  charge_cooldown = 30,
  discharge_animation = accumulator_mk2_discharge(),
  discharge_cooldown = 60
}

local item = {
    type = "item",
    name = "accumulator-mk2",
    stack_size = 50,
    place_result = "accumulator-mk2",
    icon = "__accumulator-mk2__/graphics/icons/accumulator-mk2.png",
    subgroup = "energy",
    order = "e[accumulator]-a[accumulator]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
}

local recipe = {
    type = "recipe",
    name = "accumulator-mk2-recipe",
    enabled = false,
    energy_required = 5.0,
    subgroup = "energy",
    icon = "__accumulator-mk2__/graphics/icons/accumulator-mk2.png",
    ingredients = {
        {type = "item", name = "accumulator", amount = 1},
        {type = "item", name = "supercapacitor", amount = 5},
        {type = "item", name = "superconductor", amount = 2}
    },
    results = {
        {type = "item", name = "accumulator-mk2", amount = 1}
    }
}

local technology = {
    type = "technology",
    name = "accumulator-mk2-technology",
    icon_size = 256,
    icon = "__accumulator-mk2__/graphics/technology/electric-energy-acumulators-2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "accumulator-mk2-recipe"
      }
    },
    unit =
    {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"electromagnetic-science-pack", 1},
      },
      time = 60
    },
    prerequisites = {"electric-energy-accumulators", "electromagnetic-science-pack"}
}

data:extend{accumulator_prototype, item, recipe, technology}