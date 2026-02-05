execute if score Global tzz_task_3_catcher_lock matches 1 run \
 tellraw @a [{text:"[全员逃走中]",color:"gold"},\
 {"text":" 任务三通报猎人没有被封锁,将持续至游戏结束!","color":"#ff0000"}]

schedule function tzz_game_running:tack_4/start_task_4 300s

# OP计时器：5分钟后开始复活任务
data modify storage tzz_game:op_timer event set value "复活任务开始"
scoreboard players set Global tzz_op_timer_remaining 300