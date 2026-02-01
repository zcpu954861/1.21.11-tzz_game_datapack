#猎人选择出生位置F：释放旧锁 -> 锁定F -> 记录 -> 提示
execute if score @s tzz_catcher_spawn_selected matches 1 run scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 2 run scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 3 run scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 4 run scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 5 run scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 6 run scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 7 run scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 8 run scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
execute if score @s tzz_catcher_spawn_selected matches 9 run scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 1
scoreboard players set @s tzz_catcher_spawn_selected 6

tellraw @s [{"text":"[全员逃走中] ","color":"gold"},{"text":"成功选择出生位置F。","color":"green"}]
playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

scoreboard players set @s tzz_catcher_spawn_point 0
