tellraw @a [{selector:"@p[team=tzz_team_runner]"},{text:" 使用了复活装置!",color:"green"}]
tag @p[team=tzz_team_runner] remove death
gamemode spectator @p[team=tzz_team_runner]
scoreboard players add Global tzz_revive_count 1
execute if score Global tzz_revive_count matches 4 run function tzz_game_running:tack_4/complete_task_4