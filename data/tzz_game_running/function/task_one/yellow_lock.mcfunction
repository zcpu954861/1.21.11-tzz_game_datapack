execute if score yellow tzz_task_one_catcher_chest_lock matches 0 run \
tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
{"text":" 黄色猎人箱已被封锁!","color":"#ffff00"}]

execute if score yellow tzz_task_one_catcher_chest_lock matches 0 run \
scoreboard players set yellow tzz_task_one_catcher_chest_lock 1