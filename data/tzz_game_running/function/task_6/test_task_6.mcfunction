scoreboard players remove @a[tag=!task_6_triggered_1,tag=!task_6_triggered_2,tag=!op] tzz_run_energy 10000

tellraw @a [{text:"[全员逃走中]",color:"gold"},\
{text:"没有将物品送到的逃走队员将被扣除逃走能量!",color:"#ff0000"}]

schedule function tzz_game_running:game_end/game_end 90s

# OP计时器：90秒后游戏结束
data modify storage tzz_game:op_timer event set value "游戏结束"
scoreboard players set Global tzz_op_timer_remaining 90