execute as @a at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.6 1.8
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.6 1.8
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.6 1.8
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.6 1.8
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.6 1.8

scoreboard players set Global tzz_minigame_1_timer 0

schedule function tzz_game_running:gamestart_minigame_1/timer_run 1s
schedule function tzz_game_running:gamestart_minigame_1/small_timer_run 1t