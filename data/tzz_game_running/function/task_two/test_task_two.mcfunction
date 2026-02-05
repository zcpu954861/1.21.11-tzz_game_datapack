# 广播：通知所有玩家进入“全员逃走中”状态，并警告未认证玩家
tellraw @a [{text:"[全员逃走中]",color:"gold"},{text:"没有认证的玩家将被定位抓捕!",color:"#ff0000"}]

schedule function tzz_game_running:task_3/start_task_3 300s

# OP计时器：5分钟后开始任务三
data modify storage tzz_game:op_timer event set value "任务三开始"
scoreboard players set Global tzz_op_timer_remaining 300

# 给所有未通过认证的玩家施加永久发光效果，便于定位抓捕（隐藏粒子）
effect give @a[tag=!certification_male_passed,tag=!certification_female_passed] minecraft:glowing infinite 1 true