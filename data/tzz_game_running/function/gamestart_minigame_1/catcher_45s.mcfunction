tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
{"text":"猎人将在15秒后放出!","color":"red","bold":true}]

# OP计时器：15秒后猎人放出
data modify storage tzz_game:op_timer event set value "猎人放出"
scoreboard players set Global tzz_op_timer_remaining 15

title @a actionbar [{"text":"猎人将在15秒后放出!","color":"red","bold":true}]

schedule function tzz_game_running:gamestart_minigame_1/catcher_open 15s