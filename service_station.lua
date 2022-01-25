local service_station = table.deepcopy(data.raw["roboport"]["roboport"])
service_station.name = "service_station"
service_station.minable = {hardness = 0.2, mining_time = 0.5, result = "service_station"}
service_station.logistics_radius = 10
service_station.construction_radius = 0

local service_station_item = table.deepcopy(data.raw["item"]["roboport"])
service_station_item.name = "service_station"
service_station_item.place_result = "service_station"
service_station_item.order = service_station_item.order .. "b"

local service_station_recipe = {
    type = "recipe",
    name = "service_station",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 45},
      {"iron-gear-wheel", 45},
      {"advanced-circuit", 45},
    },
    result = "service_station",
    result_count = 1,
    energy = 1
  }

local service_station_easy_recipe = {
    type = "recipe",
    name = "service_station",
    enabled = false,
    ingredients =
    {
      {"roboport", 1},
    },
    result = "service_station",
    result_count = 1,
    energy = 1
  }

if settings.startup["constructron-easy-recipe-toggle"].value then
  data:extend({service_station, service_station_item, service_station_easy_recipe})
else
  data:extend({service_station, service_station_item, service_station_recipe})
end


table.insert(data.raw["technology"]["spidertron"].effects,{type = "unlock-recipe", recipe="service_station"})
