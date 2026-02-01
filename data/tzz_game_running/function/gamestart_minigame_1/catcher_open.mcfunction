setblock -374 79 2184 minecraft:iron_door[powered=false,facing=south,open=true]
setblock -376 79 2184 minecraft:iron_door[powered=false,facing=south,open=true]
setblock -378 79 2184 minecraft:iron_door[powered=false,facing=south,open=true]
title @a title [{"text":""}]
title @a subtitle [{"text":"猎人已放出!","color":"#8b0000","bold":true}]
fill -373 82 2165 -379 80 2165 air
fill -373 82 2170 -379 80 2170 air
fill -379 82 2169 -379 80 2166 air
fill -373 82 2169 -373 80 2166 air
particle minecraft:poof -375.44 80.00 2185.44 3 2 2 0 1000
particle minecraft:wax_on -375.44 80.00 2185.44 3 2 2 0 500

# OP计时器：5分钟后开始任务一
data modify storage tzz_game:op_timer event set value "任务一开始"
scoreboard players set Global tzz_op_timer_remaining 300
schedule function tzz_game_running:task_one/task_one_start 300s