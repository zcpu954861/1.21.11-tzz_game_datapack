function tzz_game:tzz_config/gamestart/catcher_doors_open
title @a title [{"text":""}]
title @a subtitle [{"text":"猎人已放出!","color":"#8b0000","bold":true}]
function tzz_game:tzz_config/gamestart/arena_fill_air
function tzz_game:tzz_config/gamestart/catcher_fx

# OP计时器：5分钟后开始任务一
data modify storage tzz_game:op_timer event set value "任务一开始"
scoreboard players set Global tzz_op_timer_remaining 300
schedule function tzz_game_running:task_one/task_one_start 300s