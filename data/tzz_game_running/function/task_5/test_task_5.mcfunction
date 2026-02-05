tellraw @a \
 [{text:"[全员逃走中]",color:"gold"},\
 {text:" 场上的奖励装置已经失效!",color:"#ff0000"}]

setblock -535 69 2008 air
setblock -265 73 2146 air
setblock -438 74 2245 air

schedule function tzz_game_running:task_6/start_task_6 300s

# OP计时器：5分钟后开始任务五
data modify storage tzz_game:op_timer event set value "任务五开始(运送物品)"
scoreboard players set Global tzz_op_timer_remaining 300