data:extend({
  {
      type = "explosion",
      name = "water-drain-sound",
      flags = {"not-on-map"},
      animations =
      {
          {
              filename = "__core__/graphics/empty.png",
              priority = "extra-high",
              width = 1,
              height = 1,
              frame_count = 1
          }
      },
      sound =
      {
          {
              filename = "__finitewater__/sound/water_drain.ogg",
              volume = 1
          }
      },
  },
})