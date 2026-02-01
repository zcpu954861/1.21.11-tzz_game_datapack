schedule clear tzz_game_running:gamestart_minigame_1/timer_run
schedule clear tzz_game_running:gamestart_minigame_1/small_timer_run

title @a actionbar [{"text":""}]

function tzz_game:tzz_config/gamestart/stop_button_remove

tellraw @a [{"text":"[全员逃走中]","color":"yellow"},\
{"text":"三秒后进行验证","color":"yellow"}]

schedule function tzz_game_running:gamestart_minigame_1/minigame_1_test 3s