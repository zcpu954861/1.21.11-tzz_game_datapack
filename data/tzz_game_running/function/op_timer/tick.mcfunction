#OP actionbar计时器

# mode=1：复活任务显示复活人数(0/4)
execute if score Global tzz_op_timer_mode matches 1 as @a[tag=op] at @s run \
 title @s actionbar [{"text":"复活玩家数量(","color":"gold"},{"score":{"name":"Global","objective":"tzz_revive_count"},"color":"aqua"},{"text":"/4)","color":"gold"}]

# 其它模式：正常倒计时
execute unless score Global tzz_op_timer_mode matches 1 run function tzz_game_running:op_timer/tick_countdown
