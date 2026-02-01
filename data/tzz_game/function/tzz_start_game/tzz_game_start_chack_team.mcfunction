# 检测所有玩家是否已加入队伍
# 1. 清零未分组玩家计数
execute as @a[scores={tzz_game_start_process=1..}] at @s run \
scoreboard players set Global tzz_unassigned 0

# 2. 统计未分组玩家数量
execute as @a[scores={tzz_game_start_process=1..}] at @s run \
execute as @a[team=] \
run scoreboard players add Global tzz_unassigned 1

# 3. 如果有未分组玩家，广播提示
execute as @a[scores={tzz_game_start_process=1..}] at @s run \
execute if score Global tzz_unassigned matches 1.. \
run tellraw @a [{"text":"[全员逃走中] ","color":"gold"},\
{"text":"有玩家未选择队伍，请全部玩家选择队伍后再开始游戏！","color":"red"}]

# 4. 如果所有玩家都已分组，可继续后续流程（此处可加后续检测或流程）
execute as @a[scores={tzz_game_start_process=1..}] at @s run \
execute unless score Global tzz_unassigned matches 1.. \
run tellraw @a [{"text":"[全员逃走中] ","color":"gold"},\
{"text":"所有玩家已选择队伍，可以开始游戏。","color":"green"}]

execute as @a[scores={tzz_game_start_process=1..}] at @s run \
function tzz_game:tzz_start_game/tzz_game_start_board_reset




