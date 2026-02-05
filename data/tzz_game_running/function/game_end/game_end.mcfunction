
# 游戏结束：清理全部计划任务 + 输出本局统计

# 关键状态复位（避免 tick 中的开局逻辑被再次触发）
scoreboard players set Global tzz_game_active 0
scoreboard players set Global tzz_current_task 0
scoreboard players set Global tzz_team_check_done 0

# OP计时器：游戏结束后无后续事件
data modify storage tzz_game:op_timer event set value "游戏结束!"
scoreboard players set Global tzz_op_timer_remaining 0
scoreboard players set Global tzz_op_timer_tick 0

# --------------------
# 终止全部定时任务（schedule）
# --------------------

# 自循环能量
schedule clear tzz_game:tzz_game_energy/tzz_game_energy

# 全局广播
schedule clear tzz_scheduled_tasks:tzz_global_broadcast

# 开始游戏 10 秒倒计时
schedule clear tzz_game:tzz_start_game_10second/0second_start
schedule clear tzz_game:tzz_start_game_10second/1second
schedule clear tzz_game:tzz_start_game_10second/2second
schedule clear tzz_game:tzz_start_game_10second/3second
schedule clear tzz_game:tzz_start_game_10second/4second
schedule clear tzz_game:tzz_start_game_10second/5second
schedule clear tzz_game:tzz_start_game_10second/6second
schedule clear tzz_game:tzz_start_game_10second/7second
schedule clear tzz_game:tzz_start_game_10second/8second
schedule clear tzz_game:tzz_start_game_10second/9second

# 开局阶段其它计划任务
schedule clear tzz_game:tzz_start_game/tzz_team_check_done_reset
schedule clear tzz_game_running:gamestart_minigame_1/timer_run
schedule clear tzz_game_running:gamestart_minigame_1/small_timer_run
schedule clear tzz_game_running:gamestart_minigame_1/minigame_1_test
schedule clear tzz_game_running:gamestart_minigame_1/start_timer
schedule clear tzz_game_running:gamestart_minigame_1/catcher_45s
schedule clear tzz_game_running:gamestart_minigame_1/catcher_open
schedule clear tzz_game_running:gamestart_minigame_1/stop_timer
schedule clear tzz_game_running:gamestart_minigame_1/tellraw_and_run
schedule clear tzz_game_running:gamestart_minigame_1/load_gamestart_part
schedule clear tzz_game_running:gamestart_minigame_1/start

# 猎人箱刷新
schedule clear tzz_game_running:gamestart_catcherbox_spawn/catcherbox_spawn_1
schedule clear tzz_game_running:gamestart_catcherbox_spawn/catcherbox_spawn_2
schedule clear tzz_game_running:gamestart_catcherbox_spawn/catcherbox_spawn_3

# 任务链（1 -> 2 -> 3 -> 4 -> 5 -> 6 -> end）
schedule clear tzz_game_running:task_one/task_one_start
schedule clear tzz_game_running:task_one/test_task_one
schedule clear tzz_game_running:task_two/start_task_two
schedule clear tzz_game_running:task_two/test_task_two
schedule clear tzz_game_running:task_3/start_task_3
schedule clear tzz_game_running:task_3/test_task_3
schedule clear tzz_game_running:tack_4/start_task_4
schedule clear tzz_game_running:task_5/start_task_5
schedule clear tzz_game_running:task_5/test_task_5
schedule clear tzz_game_running:task_6/start_task_6
schedule clear tzz_game_running:task_6/test_task_6

# 取消可能已被排程的“游戏结束”自身（防止重复执行）
schedule clear tzz_game_running:game_end/game_end

# --------------------
# 统计数据（聊天栏输出）
# --------------------

# 人数统计（使用 tzz_player_count 目标作为临时计数器）
scoreboard players set runner_total tzz_player_count 0
execute as @a[team=tzz_team_runner] run scoreboard players add runner_total tzz_player_count 1

scoreboard players set runner_alive tzz_player_count 0
execute as @a[team=tzz_team_runner,tag=!death] run scoreboard players add runner_alive tzz_player_count 1

scoreboard players set catcher_total tzz_player_count 0
execute as @a[team=tzz_team_catcher] run scoreboard players add catcher_total tzz_player_count 1

# 总逃走能量
scoreboard players set Total tzz_run_energy 0
execute as @a[team=tzz_team_runner] run scoreboard players operation Total tzz_run_energy += @s tzz_run_energy

# 猎人总抓捕
scoreboard players set TotalKill tzz_catcher_kill_count 0
execute as @a[team=tzz_team_catcher] run scoreboard players operation TotalKill tzz_catcher_kill_count += @s tzz_catcher_kill_count

tellraw @a [{"text":"[全员逃走中] ","color":"gold"},{"text":"游戏结束！","color":"red"}]

# 冠军：逃走能量最高的逃走者（并列则多人获胜）
scoreboard players set maxEnergy tzz_run_energy 0
execute if score runner_total tzz_player_count matches 1.. as @a[team=tzz_team_runner] if score @s tzz_run_energy > maxEnergy tzz_run_energy run scoreboard players operation maxEnergy tzz_run_energy = @s tzz_run_energy

execute if score runner_total tzz_player_count matches 1.. run tellraw @a [{"text":"本局冠军（能量 = ","color":"gold"},{"score":{"name":"maxEnergy","objective":"tzz_run_energy"},"color":"aqua"},{"text":"）：","color":"gold"}]
execute if score runner_total tzz_player_count matches 1.. as @a[team=tzz_team_runner] if score @s tzz_run_energy = maxEnergy tzz_run_energy run tellraw @a [{"text":"- ","color":"gray"},{"selector":"@s","color":"yellow"},{"text":"（","color":"gray"},{"score":{"name":"@s","objective":"tzz_run_energy"},"color":"aqua"},{"text":"）","color":"gray"}]
execute if score runner_total tzz_player_count matches 0 run tellraw @a [{"text":"本局无逃走者参与，无法评选冠军。","color":"red"}]

tellraw @a [{"text":"本局统计：","color":"yellow"}]
tellraw @a [{"text":"- 逃走者：","color":"aqua"},{"score":{"name":"runner_total","objective":"tzz_player_count"},"color":"white"},{"text":" 人（存活 ","color":"aqua"},{"score":{"name":"runner_alive","objective":"tzz_player_count"},"color":"white"},{"text":"）","color":"aqua"}]
tellraw @a [{"text":"- 猎人：","color":"#FF4500"},{"score":{"name":"catcher_total","objective":"tzz_player_count"},"color":"white"},{"text":" 人","color":"#FF4500"}]
tellraw @a [{"text":"- 总逃走能量：","color":"#00BFFF"},{"score":{"name":"Total","objective":"tzz_run_energy"},"color":"white"}]
tellraw @a [{"text":"- 猎人总抓捕：","color":"#FF4500"},{"score":{"name":"TotalKill","objective":"tzz_catcher_kill_count"},"color":"white"}]
tellraw @a [{"text":"- 复活次数：","color":"green"},{"score":{"name":"Global","objective":"tzz_revive_count"},"color":"white"}]
tellraw @a [{"text":"- 任务5触发（1/2/3）：","color":"yellow"},{"score":{"name":"Global","objective":"tzz_task_5_1_triggered_count"},"color":"white"},{"text":" / ","color":"gray"},{"score":{"name":"Global","objective":"tzz_task_5_2_triggered_count"},"color":"white"},{"text":" / ","color":"gray"},{"score":{"name":"Global","objective":"tzz_task_5_3_triggered_count"},"color":"white"}]
tellraw @a [{"text":"- 任务6触发（1/2）：","color":"yellow"},{"score":{"name":"Global","objective":"tzz_task_6_1_triggered_count"},"color":"white"},{"text":" / ","color":"gray"},{"score":{"name":"Global","objective":"tzz_task_6_2_triggered_count"},"color":"white"}]

# 任务情况汇总（尽量覆盖所有任务的“可量化状态”）
scoreboard players set cert_total tzz_player_count 0
execute as @a[team=tzz_team_runner,tag=certification_male_passed] run scoreboard players add cert_total tzz_player_count 1
execute as @a[team=tzz_team_runner,tag=certification_female_passed] run scoreboard players add cert_total tzz_player_count 1
scoreboard players operation uncert tzz_player_count = runner_total tzz_player_count
scoreboard players operation uncert tzz_player_count -= cert_total tzz_player_count

tellraw @a [{"text":"本局任务情况：","color":"yellow"}]
tellraw @a [{"text":"- 当前任务编号：","color":"aqua"},{"score":{"name":"Global","objective":"tzz_current_task"},"color":"white"}]

# 起跑小游戏（Minigame 1）
tellraw @a [{"text":"- 起跑游戏：触发计数=","color":"aqua"},{"score":{"name":"Global","objective":"tzz_minigame_1_ok"},"color":"white"},{"text":" | 计时=","color":"aqua"},{"score":{"name":"Global","objective":"tzz_minigame_1_timer"},"color":"white"},{"text":"s","color":"aqua"}]

# 任务1（猎人箱上锁状态）
tellraw @a [{"text":"- 任务1 猎人箱上锁(1=锁定)：黄=","color":"aqua"},{"score":{"name":"yellow","objective":"tzz_task_one_catcher_chest_lock"},"color":"white"},{"text":" 紫=","color":"aqua"},{"score":{"name":"purple","objective":"tzz_task_one_catcher_chest_lock"},"color":"white"},{"text":" 绿=","color":"aqua"},{"score":{"name":"green","objective":"tzz_task_one_catcher_chest_lock"},"color":"white"}]

# 任务2（认证情况）
tellraw @a [{"text":"- 任务2 认证：已认证=","color":"aqua"},{"score":{"name":"cert_total","objective":"tzz_player_count"},"color":"white"},{"text":" | 未认证=","color":"aqua"},{"score":{"name":"uncert","objective":"tzz_player_count"},"color":"white"}]

# 任务3（猎人封锁）
tellraw @a [{"text":"- 任务3 猎人封锁(1=已封锁)：","color":"aqua"},{"score":{"name":"Global","objective":"tzz_task_3_catcher_lock"},"color":"white"}]

# 任务4（复活）
tellraw @a [{"text":"- 任务4 复活次数：","color":"aqua"},{"score":{"name":"Global","objective":"tzz_revive_count"},"color":"white"}]

# 任务5/6（触发计数，上面已输出，这里再归档一行）
tellraw @a [{"text":"- 任务5 触发计数(1/2/3)：","color":"aqua"},{"score":{"name":"Global","objective":"tzz_task_5_1_triggered_count"},"color":"white"},{"text":"/","color":"gray"},{"score":{"name":"Global","objective":"tzz_task_5_2_triggered_count"},"color":"white"},{"text":"/","color":"gray"},{"score":{"name":"Global","objective":"tzz_task_5_3_triggered_count"},"color":"white"}]
tellraw @a [{"text":"- 任务6 触发计数(1/2)：","color":"aqua"},{"score":{"name":"Global","objective":"tzz_task_6_1_triggered_count"},"color":"white"},{"text":"/","color":"gray"},{"score":{"name":"Global","objective":"tzz_task_6_2_triggered_count"},"color":"white"}]

tellraw @a [{"text":"---- 逃走者能量列表 ----","color":"#00BFFF"}]
execute as @a[team=tzz_team_runner] run tellraw @a [{"text":"- ","color":"gray"},{"selector":"@s","color":"yellow"},{"text":"：","color":"gray"},{"score":{"name":"@s","objective":"tzz_run_energy"},"color":"aqua"}]

tellraw @a [{"text":"---- 猎人抓捕列表 ----","color":"#FF4500"}]
execute as @a[team=tzz_team_catcher] run tellraw @a [{"text":"- ","color":"gray"},{"selector":"@s","color":"yellow"},{"text":"：","color":"gray"},{"score":{"name":"@s","objective":"tzz_catcher_kill_count"},"color":"#FF4500"}]
