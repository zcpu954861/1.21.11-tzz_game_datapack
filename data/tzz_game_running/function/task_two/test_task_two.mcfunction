tellraw @a [{text:"[全员逃走中]",color:"gold"},{text:"没有认证的玩家将被定位抓捕!",color:"#ff0000"}]

# OP计时器：后续事件未知/未设置
data modify storage tzz_game:op_timer event set value "无后续事件"
scoreboard players set Global tzz_op_timer_remaining 0

effect give @a[tag=!certification_male_passed,tag=!certification_female_passed] minecraft:glowing infinite 1 true