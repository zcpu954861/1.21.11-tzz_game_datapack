#检测玩家是否全部准备并开始游戏
execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 scoreboard players set player_numbers tzz_game_start_ready_cnt 0

execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 scoreboard players set Global tzz_game_start_ready_ok 0

execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 execute as @a[scores={tzz_game_start_ready=1..}] at @s run \
 scoreboard players add player_numbers tzz_game_start_ready_cnt 1

execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 execute if score player_numbers tzz_game_start_ready_cnt = Global tzz_player_number run \
 tellraw @a [{text:"[全员逃走中] ",color:gold},{text:"全部玩家已准备!",color:"green"}]

execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 execute if score player_numbers tzz_game_start_ready_cnt = Global tzz_player_number run \
 scoreboard players set Global tzz_game_start_ready_ok 1

execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 execute unless score player_numbers tzz_game_start_ready_cnt = Global tzz_player_number run \
 tellraw @a [{text:"[全员逃走中] ",color:gold},{text:"还有玩家未准备!",color:"red"}]

#开始游戏
execute if entity @a[scores={tzz_game_start_ready_check=1..}] run \
 scoreboard players set Global tzz_unassigned 0
execute if entity @a[scores={tzz_game_start_ready_check=1..}] as @a[team=] run \
 scoreboard players add Global tzz_unassigned 1

execute if entity @a[scores={tzz_game_start_ready_check=1..}] unless \
 score Global tzz_unassigned matches 1.. if \
 score Global tzz_game_start_ready_ok matches 1 run \
 scoreboard players set Global tzz_team_check_done 1

execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 tellraw @a[tag=op] [{"text":"[全员逃走中][DEBUG] ready_cnt=","color":"dark_gray"},\
 {"score":{"name":"player_numbers","objective":"tzz_game_start_ready_cnt"}},\
 {"text":" / player_total=","color":"dark_gray"},\
 {"score":{"name":"Global","objective":"tzz_player_number"}},\
 {"text":"  unassigned=","color":"dark_gray"},\
 {"score":{"name":"Global","objective":"tzz_unassigned"}},\
 {"text":"  ready_ok=","color":"dark_gray"},\
 {"score":{"name":"Global","objective":"tzz_game_start_ready_ok"}},\
 {"text":"  team_check_done=","color":"dark_gray"},\
 {"score":{"name":"Global","objective":"tzz_team_check_done"}}]

#重置开始游戏进程记分板分数
execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 execute as @a[scores={tzz_game_start_process=1..}] at @s run \
 scoreboard players set @s tzz_game_start_process 0

execute as @a[scores={tzz_game_start_ready_check=1..}] at @s run \
 scoreboard players reset @s tzz_game_start_ready_check

#重置开始游戏进程记分板分数
execute as @a[scores={tzz_game_start_process=1..}] at @s run \
 scoreboard players set @s tzz_game_start_process 0
