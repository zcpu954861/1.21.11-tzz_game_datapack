#本文件用于为玩家添加状态效果

#猎人组
effect give @a[team=tzz_team_catcher] minecraft:speed 2 1 true
effect give @a[team=tzz_team_catcher] minecraft:saturation 2 255 true
effect give @a[team=tzz_team_catcher] minecraft:strength 2 255 true
effect give @a[team=tzz_team_catcher] minecraft:resistance 2 5 true

#逃走者组
effect give @a[team=tzz_team_runner] minecraft:saturation 2 255 true

effect give @a[tag=!op] xaerominimap:no_cave_maps 2 0 true
effect give @a[tag=!op] xaerominimap:no_entity_radar 2 0 true
effect give @a[tag=!op] xaerominimap:no_minimap 2 0 true
effect give @a[tag=!op] xaerominimap:no_waypoints 2 0 true
effect give @a[tag=!op] xaeroworldmap:no_cave_maps 2 0 true
effect give @a[tag=!op] xaeroworldmap:no_world_map 2 0 true