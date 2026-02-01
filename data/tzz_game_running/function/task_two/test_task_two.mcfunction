# 广播：通知所有玩家进入“全员逃走中”状态，并警告未认证玩家
tellraw @a [{text:"[全员逃走中]",color:"gold"},{text:"没有认证的玩家将被定位抓捕!",color:"#ff0000"}]

# 将 OP 计时器的事件字段设为占位字符串，表示当前无后续事件
data modify storage tzz_game:op_timer event set value "无后续事件"

# 重置全局 OP 计时器剩余时间（用于后续计时逻辑）
scoreboard players set Global tzz_op_timer_remaining 0

# 给所有未通过认证的玩家施加永久发光效果，便于定位抓捕（隐藏粒子）
effect give @a[tag=!certification_male_passed,tag=!certification_female_passed] minecraft:glowing infinite 1 true