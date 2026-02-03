execute if score Global tzz_task_3_catcher_lock matches 0 run \
 gamemode spectator @a[scores={tzz_catcher_spawn_selected=7}]

execute if score Global tzz_task_3_catcher_lock matches 0 run \
 tellraw @a [{text:"[全员逃走中]",color:"gold"},\
 {"text":" 任务三通报猎人已移除!","color":"#00ff00"}]

execute if score Global tzz_task_3_catcher_lock matches 0 run \
 scoreboard players set Global tzz_task_3_catcher_lock 1