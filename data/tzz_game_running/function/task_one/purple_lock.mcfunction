execute if score purple tzz_task_one_catcher_chest_lock matches 0 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 紫色猎人箱已被封锁!","color":"#b600b6"}]

execute if score purple tzz_task_one_catcher_chest_lock matches 0 run \
 scoreboard players set purple tzz_task_one_catcher_chest_lock 1