tellraw @a [{"text":"[全员逃走中]",color:"gold"},\
{"text":" 你需要预估的时长: ","color":"yellow"},\
{"storage":"tzz_running_game:random_time","nbt":"random_time","color":"aqua"},\
{"text":" 秒","color":"yellow"}]

$scoreboard players set Global tzz_minigame_1_countdown $(random_time)

tellraw @a [{"text":"[全员逃走中]",color:"gold"},\
{"text":" 请你五秒后开始计时","color":"yellow"}]

schedule function tzz_game_running:gamestart_minigame_1/start_timer 5s

