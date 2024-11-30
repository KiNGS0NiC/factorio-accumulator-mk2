require("graphics")
local item_sounds = require("__base__.prototypes.item_sounds")

local accumulator_prototype = {
  type = "accumulator",
  name = "accumulator-mk2",
  icon = "__accumulator-mk2__/graphics/icons/accumulator-mk2.png",
  minable = {
    mining_time = 0.1,
    result = "accumulator-mk2"
  },
  flags = {"placeable-neutral", "player-creation"},
  fast_replaceable_group = "accumulator",
  drawing_box_vertical_extension = 0.5,
  corpse = "accumulator-remnants",
  dying_explosion = "accumulator-explosion",
  max_health = 200,
  collision_box = {
    {-0.9, -0.9},
    {0.9, 0.9}
  },
  selection_box = {
    {-1, -1},
    {1, 1}
  },
  energy_source =
  {
    type = "electric",
    buffer_capacity = "50MJ",
    usage_priority = "tertiary",
    input_flow_limit = "900kW",
    output_flow_limit = "900kW"
  },
  chargable_graphics =
  {
    picture = accumulator_mk2_picture(),
    charge_animation = accumulator_mk2_charge(),
    charge_cooldown = 30,
    discharge_animation = accumulator_mk2_discharge(),
    discharge_cooldown = 60
  }
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