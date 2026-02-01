#开始读秒器预热 然后激活读秒器
scoreboard players set Global tzz_minigame_1_countdown 0
scoreboard players set Global tzz_minigame_1_timer 0
scoreboard players set Global tzz_minigame_1_timer_small 0

#随机生成运行时间
execute store result storage tzz_running_game:random_time random_time int 1 run random value 20..30

function tzz_game_running:gamestart_minigame_1/tellraw_and_run with storage tzz_running_game:random_time