execute if score green tzz_task_one_catcher_chest_lock matches 0 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 绿色猎人箱已被封锁!","color":"#00ff00"}]

execute if score green tzz_task_one_catcher_chest_lock matches 0 run \
 scoreboard players set green tzz_task_one_catcher_chest_lock 1