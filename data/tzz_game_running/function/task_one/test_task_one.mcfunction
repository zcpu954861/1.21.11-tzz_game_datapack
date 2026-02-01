function tzz_game_running:task_one/catcher_open
# 0 0 0
execute if score green tzz_task_one_catcher_chest_lock matches 0 \
 if score yellow tzz_task_one_catcher_chest_lock matches 0 \
 if score purple tzz_task_one_catcher_chest_lock matches 0 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 所有猎人箱均未封锁,猎人将放出!","color":"#ff0000"}]

# 1 0 0
execute if score green tzz_task_one_catcher_chest_lock matches 1 \
 if score yellow tzz_task_one_catcher_chest_lock matches 0 \
 if score purple tzz_task_one_catcher_chest_lock matches 0 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 绿色猎人箱已被封锁,不放出!","color":"#00ff00"},\
 {"text":" 其余猎人箱仍未封锁,猎人将放出!","color":"#ff0000"}]

# 0 1 0
execute if score green tzz_task_one_catcher_chest_lock matches 0 \
 if score yellow tzz_task_one_catcher_chest_lock matches 1 \
 if score purple tzz_task_one_catcher_chest_lock matches 0 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 黄色猎人箱已被封锁,不放出!","color":"#ffff00"},\
 {"text":" 其余猎人箱仍未封锁,猎人将放出!","color":"#ff0000"}]

# 0 0 1
execute if score green tzz_task_one_catcher_chest_lock matches 0 \
 if score yellow tzz_task_one_catcher_chest_lock matches 0 \
 if score purple tzz_task_one_catcher_chest_lock matches 1 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 紫色猎人箱已被封锁,不放出!","color":"#b600b6"},\
 {"text":" 其余猎人箱仍未封锁,猎人将放出!","color":"#ff0000"}]

# 1 1 0
execute if score green tzz_task_one_catcher_chest_lock matches 1 \
 if score yellow tzz_task_one_catcher_chest_lock matches 1 \
 if score purple tzz_task_one_catcher_chest_lock matches 0 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 绿色猎人箱和黄色猎人箱已被封锁,不放出!","color":"#00ff00"},\
 {"text":" 紫色猎人箱仍未封锁,猎人将放出!","color":"#ff0000"}]

# 1 0 1
execute if score green tzz_task_one_catcher_chest_lock matches 1 \
 if score yellow tzz_task_one_catcher_chest_lock matches 0 \
 if score purple tzz_task_one_catcher_chest_lock matches 1 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 绿色猎人箱和紫色猎人箱已被封锁,不放出!","color":"#00ff00"},\
 {"text":" 黄色猎人箱仍未封锁,猎人将放出!","color":"#ff0000"}]

# 0 1 1
execute if score green tzz_task_one_catcher_chest_lock matches 0 \
 if score yellow tzz_task_one_catcher_chest_lock matches 1 \
 if score purple tzz_task_one_catcher_chest_lock matches 1 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 黄色猎人箱和紫色猎人箱已被封锁,不放出!","color":"#ffff00"},\
 {"text":" 绿色猎人箱仍未封锁,猎人将放出!","color":"#ff0000"}]

# 1 1 1
execute if score green tzz_task_one_catcher_chest_lock matches 1 \
 if score yellow tzz_task_one_catcher_chest_lock matches 1 \
 if score purple tzz_task_one_catcher_chest_lock matches 1 run \
 tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
 {"text":" 所有猎人箱均已封锁,猎人不放出!","color":"#00ff00"}]

# OP计时器：5分钟后开始任务二
data modify storage tzz_game:op_timer event set value "任务二开始"
scoreboard players set Global tzz_op_timer_remaining 300

schedule function tzz_game_running:task_two/start_task_two 300s