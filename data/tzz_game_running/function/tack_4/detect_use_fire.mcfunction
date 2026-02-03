# 检测由发射器发射的烟花火箭并只触发一次 `use_fire`（仅在任务4时生效）
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~-1 ~ minecraft:dispenser run function tzz_game_running:tack_4/use_fire
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~ ~ minecraft:dispenser run function tzz_game_running:tack_4/use_fire
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~1 ~ minecraft:dispenser run function tzz_game_running:tack_4/use_fire
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~1 ~ ~ minecraft:dispenser run function tzz_game_running:tack_4/use_fire
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~-1 ~ ~ minecraft:dispenser run function tzz_game_running:tack_4/use_fire
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~ ~1 minecraft:dispenser run function tzz_game_running:tack_4/use_fire
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~ ~-1 minecraft:dispenser run function tzz_game_running:tack_4/use_fire

# 给已处理的火箭打上标签，避免重复触发同一实体（仅在任务4时生效）
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~-1 ~ minecraft:dispenser run tag @s add tzz_handled_firework
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~ ~ minecraft:dispenser run tag @s add tzz_handled_firework
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~1 ~ minecraft:dispenser run tag @s add tzz_handled_firework
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~1 ~ ~ minecraft:dispenser run tag @s add tzz_handled_firework
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~-1 ~ ~ minecraft:dispenser run tag @s add tzz_handled_firework
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~ ~1 minecraft:dispenser run tag @s add tzz_handled_firework
execute if score Global tzz_current_task matches 4 run execute as @e[type=minecraft:firework_rocket,tag=!tzz_handled_firework] at @s if block ~ ~ ~-1 minecraft:dispenser run tag @s add tzz_handled_firework