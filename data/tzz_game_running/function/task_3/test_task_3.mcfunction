execute if score Global tzz_task_3_catcher_lock matches 1 run \
 tellraw @a [{text:"[全员逃走中]",color:"gold"},\
 {"text":" 任务三通报猎人没有被封锁,将持续至游戏结束!","color":"#ff0000"}]

schedule function tzz_game_running:tack_4/start_task_4 300s