#OP actionbar计时器（倒计时模式）

#每tick计数，满20tick视为1秒
scoreboard players add Global tzz_op_timer_tick 1
execute if score Global tzz_op_timer_tick matches 20.. run scoreboard players set Global tzz_op_timer_tick 0
execute if score Global tzz_op_timer_tick matches 0 if score Global tzz_op_timer_remaining matches 1.. run scoreboard players remove Global tzz_op_timer_remaining 1

#计算分钟与秒
scoreboard players operation tmp tzz_op_timer_math = Global tzz_op_timer_remaining
scoreboard players operation min tzz_op_timer_math = Global tzz_op_timer_remaining
scoreboard players operation min tzz_op_timer_math /= const_60 tzz_op_timer_math
scoreboard players operation sec tzz_op_timer_math = Global tzz_op_timer_remaining
scoreboard players operation sec tzz_op_timer_math %= const_60 tzz_op_timer_math

#显示OP actionbar
execute as @a[tag=op] at @s if score sec tzz_op_timer_math matches 0..9 run \
 title @s actionbar [{"text":"下个事件: ","color":"gold"},{"nbt":"event","storage":"tzz_game:op_timer","color":"aqua"},{"text":" | ","color":"yellow"},{"score":{"name":"min","objective":"tzz_op_timer_math"},"color":"green"},{"text":"分","color":"yellow"},{"text":"0","color":"green"},{"score":{"name":"sec","objective":"tzz_op_timer_math"},"color":"green"},{"text":"秒","color":"yellow"}]

execute as @a[tag=op] at @s if score sec tzz_op_timer_math matches 10.. run \
 title @s actionbar [{"text":"下个事件: ","color":"gold"},{"nbt":"event","storage":"tzz_game:op_timer","color":"aqua"},{"text":" | ","color":"yellow"},{"score":{"name":"min","objective":"tzz_op_timer_math"},"color":"green"},{"text":"分","color":"yellow"},{"score":{"name":"sec","objective":"tzz_op_timer_math"},"color":"green"},{"text":"秒","color":"yellow"}]
