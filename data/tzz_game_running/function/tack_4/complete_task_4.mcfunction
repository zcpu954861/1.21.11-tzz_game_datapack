tellraw @a [{text:"[全员逃走中]",color:"gold"},{text:" 复活人数已达四人,游戏继续",color:"#00ff00"}]

tp @a[team=tzz_team_runner] -496.5 75.00 2103.5
gamemode adventure @a[team=tzz_team_runner,tag=!death]

tp @a[team=tzz_team_catcher] -375.5 75.00 2133.5
gamemode adventure @a[team=tzz_team_catcher,tag=task_4_catcher_adventure]
gamemode creative @a[team=tzz_team_catcher,tag=task_4_catcher_creative]

schedule function tzz_game_running:task_5/start_task_5 300s

scoreboard players set Global tzz_op_timer_mode 0

# OP计时器：5分钟后开始奖励装置任务
data modify storage tzz_game:op_timer event set value "任务四开始(奖励装置)"
scoreboard players set Global tzz_op_timer_remaining 300