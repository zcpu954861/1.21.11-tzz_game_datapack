tellraw @a [{"text":"[全员逃走中]","color":"yellow"},\
{"text":"你的时间: ","color":"yellow"},\
{"score":{"name":"Global","objective":"tzz_minigame_1_timer"},"color":"aqua"},\
{"text":" : ","color":"yellow"},\
{"score":{"name":"Global","objective":"tzz_minigame_1_timer_small"},"color":"aqua"},\
{"text":" 秒","color":"yellow"}]

execute if score Global tzz_minigame_1_timer = Global tzz_minigame_1_countdown run \
tellraw @a [{"text":"[全员逃走中]","color":"yellow"},\
{"text":"验证通过!","color":"green"}]

execute if score Global tzz_minigame_1_timer = Global tzz_minigame_1_countdown run \
scoreboard players add Global tzz_minigame_1_ok 1

execute if score Global tzz_minigame_1_timer = Global tzz_minigame_1_countdown run \
tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
{"text":" 接下来请下一位逃走者游玩","color":"green"}]

execute if score Global tzz_minigame_1_timer = Global tzz_minigame_1_countdown run function tzz_game:tzz_config/gamestart/tp_runner_2_front

execute if score Global tzz_minigame_1_ok matches 2.. run \
tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
{"text":" 两次预估全部正确!","color":"green"}]

execute if score Global tzz_minigame_1_ok matches 2.. run \
tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
{"text":" 猎人将于60秒后放出!","color":"red"}]

# OP计时器：45秒后提示“15秒后放出”
execute if score Global tzz_minigame_1_ok matches 2.. run data modify storage tzz_game:op_timer event set value "猎人15秒后放出提示"
execute if score Global tzz_minigame_1_ok matches 2.. run scoreboard players set Global tzz_op_timer_remaining 45

execute if score Global tzz_minigame_1_ok matches 2.. run function tzz_game:tzz_config/gamestart/arena_fill_air

execute if score Global tzz_minigame_1_ok matches 2.. run \
schedule function tzz_game_running:gamestart_minigame_1/catcher_45s 45s

execute unless score Global tzz_minigame_1_timer = Global tzz_minigame_1_countdown run \
tellraw @a [{"text":"[全员逃走中]","color":"yellow"},\
{"text":"验证失败! 猎人立刻放出!","color":"red"}]

execute unless score Global tzz_minigame_1_timer = Global tzz_minigame_1_countdown run \
function tzz_game_running:gamestart_minigame_1/catcher_open
