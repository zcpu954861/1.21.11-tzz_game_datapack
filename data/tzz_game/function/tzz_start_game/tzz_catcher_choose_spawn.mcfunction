#用于处理猎人选择出生点（独占锁 + 成功/失败提示）
#说明：本文件已在 tick 中执行
# - 玩家点击：/trigger tzz_catcher_spawn_point set 1..9
# - 取消选择：/trigger tzz_catcher_spawn_point set 99
# - 占用锁：tzz_spawn_A..I 在 tzz_catcher_spawn_lock（0=可选，1=已占用）
# - 玩家记录：@s 的 tzz_catcher_spawn_selected（1..9，0=未选择）

#清理临时tag（防止上次异常残留）
tag @a remove tzz_spawn_select_ok
tag @a remove tzz_cancel_spawn_ok

#非猎人尝试选择：提示失败并重置触发器
execute as @a[scores={tzz_catcher_spawn_point=1..},team=!tzz_team_catcher] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"只有猎人可以选择出生位置。","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=1..},team=!tzz_team_catcher] at @s run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=1..},team=!tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

################################
# 取消选择(99)
################################
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 0 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你还没有选择任何出生位置。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 0 run \
 tag @s add tzz_cancel_spawn_ok

execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"已取消你选择的出生位置。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher,tag=tzz_cancel_spawn_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 0

execute as @a[scores={tzz_catcher_spawn_point=99},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

tag @a remove tzz_cancel_spawn_ok

################################
# A(1)
################################
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置A。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 if score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置A已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 if score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 if score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 if score tzz_spawn_A tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 1
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置A。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# B(2)
################################
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置B。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 if score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置B已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 if score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 if score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 if score tzz_spawn_B tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 2
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置B。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# C(3)
################################
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置C。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 if score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置C已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 if score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 if score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 if score tzz_spawn_C tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 3
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置C。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# D(4)
################################
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置D。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 if score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置D已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 if score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 if score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 if score tzz_spawn_D tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 4
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置D。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# E(5)
################################
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置E。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 if score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置E已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 if score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 if score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 if score tzz_spawn_E tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 5
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置E。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# F(6)
################################
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置F。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 if score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置F已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 if score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 if score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 if score tzz_spawn_F tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 6
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置F。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# G(7)
################################
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置G。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 if score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置G已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 if score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 if score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 if score tzz_spawn_G tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 7
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置G。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# H(8)
################################
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置H。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 8 \
 if score tzz_spawn_H tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置H已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 8 \
 if score tzz_spawn_H tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 8 \
 if score tzz_spawn_H tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 8 \
 if score tzz_spawn_H tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 8
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置H。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=8},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

################################
# I(9)
################################
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置I。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 9 \
 if score tzz_spawn_I tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置I已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 9 \
 if score tzz_spawn_I tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 9 \
 if score tzz_spawn_I tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_point 0

execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 9 \
 if score tzz_spawn_I tzz_catcher_spawn_lock matches 0 run \
 tag @s add tzz_spawn_select_ok

execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s \
 if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 1
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_selected 9
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置I。","color":"green"}]
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=9},team=tzz_team_catcher,tag=tzz_spawn_select_ok] at @s run \
 tag @s remove tzz_spawn_select_ok

#兜底：任何非 1..9 / 99 的值也直接清零，避免卡住
execute as @a[scores={tzz_catcher_spawn_point=10..98}] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0
execute as @a[scores={tzz_catcher_spawn_point=100..}] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

#旧逻辑保留在下方（由于上方会清零 trigger，所以下方不会再触发）

#非猎人尝试选择：提示失败并重置触发器
execute as @a[scores={tzz_catcher_spawn_point=1..},team=!tzz_team_catcher] at @s run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"只有猎人可以选择出生位置。","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=1..},team=!tzz_team_catcher] at @s run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=1..},team=!tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

############################
# 出生位置 A（1）
############################
execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置A。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 if score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置A已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 if score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 1

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_selected 1

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置A。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 1 \
 unless score tzz_spawn_A tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=1},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

############################
# 出生位置 B（2）
############################
execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置B。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 if score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置B已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 if score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 1

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_selected 2

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置B。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 2 \
 unless score tzz_spawn_B tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=2},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

############################
# 出生位置 C（3）
############################
execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置C。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 if score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置C已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 if score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 1

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_selected 3

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置C。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 3 \
 unless score tzz_spawn_C tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=3},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

############################
# 出生位置 D（4）
############################
execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置D。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 if score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置D已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 if score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 1

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_selected 4

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置D。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 4 \
 unless score tzz_spawn_D tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=4},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

############################
# 出生位置 E（5）
############################
execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置E。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 if score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置E已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 if score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 1

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_selected 5

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置E。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 5 \
 unless score tzz_spawn_E tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=5},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

############################
# 出生位置 F（6）
############################
execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置F。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 if score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置F已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 if score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 1

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_selected 6

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置F。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 6 \
 unless score tzz_spawn_F tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=6},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

############################
# 出生位置 G（7）
############################
execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"你已经选择了出生位置G。","color":"yellow"}]

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 if score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"出生位置G已被其他猎人选择！","color":"red"}]

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 if score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.bass master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 1 run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 2 run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 3 run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 4 run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 5 run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 6 run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 \
 if score @s tzz_catcher_spawn_selected matches 7 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 1

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 scoreboard players set @s tzz_catcher_spawn_selected 7

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置G。","color":"green"}]

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s \
 unless score @s tzz_catcher_spawn_selected matches 7 \
 unless score tzz_spawn_G tzz_catcher_spawn_lock matches 1 run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_catcher_spawn_point=7},team=tzz_team_catcher] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

#兜底：任何非 1..7 的值也直接清零，避免卡住
execute as @a[scores={tzz_catcher_spawn_point=8..}] at @s run \
 scoreboard players set @s tzz_catcher_spawn_point 0

