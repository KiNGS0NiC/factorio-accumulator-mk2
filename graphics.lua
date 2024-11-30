require("util")

function accumulator_mk2_picture(tint, repeat_count)
    return
    {
      layers =
      {
        {
          filename = "__accumulator-mk2__/graphics/entity/accumulator-mk2.png",
          priority = "high",
          width = 130,
          height = 189,
          repeat_count = repeat_count,
          shift = util.by_pixel(0, -11),
          tint = tint,
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
          priority = "high",
          width = 234,
          height = 106,
          repeat_count = repeat_count,
          shift = util.by_pixel(29, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  end

  function accumulator_mk2_charge()
    return
    {
      layers =
      {
        accumulator_mk2_picture({1, 1, 1, 1} , 24),
        {
          filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
          priority = "high",
          width = 178,
          height = 210,
          line_length = 6,
          frame_count = 24,
          draw_as_glow = true,
          shift = util.by_pixel(0, -22),
          scale = 0.5
        }
      }
    }
  end

  function accumulator_mk2_discharge()
    return
    {
      layers =
      {
        accumulator_mk2_picture({1, 1, 1, 1} , 24),
        {
          filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",
          priority = "high",
          width = 174,
          height = 214,
          line_length = 6,
          frame_count = 24,
          draw_as_glow = true,
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }
  end
  