#本文件用来激活开始游戏进程

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 tellraw @a [{"text":"[全员逃走中] ","color":"gold"},{"text":"游戏进程被激活","color":"green"}]

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 tellraw @a [{"text":"[全员逃走中] ","color":"gold"},\
 {"text":"安全盾将保证游戏顺利进行!","color":"aqua"}]

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 tellraw @a [{"text":"[全员逃走中] ","color":"gold"},{"text":"十秒后游戏开始!","color":"#FF8C00"}]

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 playsound block.note_block.bell master @a ~ ~ ~ 1 1 1

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 schedule function tzz_game:tzz_start_game_10second/9second 1s

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 scoreboard players set Global tzz_game_active 1

#调用逃走能量启动函数
execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 function tzz_game:tzz_game_energy/tzz_game_energy_load

#为猎人击杀数记分板重置数据
execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 scoreboard players reset @a tzz_catcher_kill_count

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 scoreboard players set @a[team=tzz_team_catcher] tzz_catcher_kill_count 0

#重置开始游戏进程记分板分数
execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 scoreboard players set Global tzz_game_start_ready_ok 0

execute if score Global tzz_team_check_done matches 1 if score Global tzz_game_active matches 0 run \
 schedule function tzz_game:tzz_start_game/tzz_team_check_done_reset 1s

