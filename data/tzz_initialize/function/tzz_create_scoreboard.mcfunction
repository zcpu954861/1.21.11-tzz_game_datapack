#本文件用于创建计分板

#初始化用户面板所需的记分板
scoreboard objectives add tzz_user_operation trigger
scoreboard players enable @a tzz_user_operation

#初始化用户加入队伍所需的记分板
#逃走者
scoreboard objectives add tzz_join_runner trigger
scoreboard players enable @a tzz_join_runner
#追捕者
scoreboard objectives add tzz_join_catcher trigger
scoreboard players enable @a tzz_join_catcher

#初始化玩家离开全部队伍所需的计分板
scoreboard objectives add tzz_leave_all_team trigger
scoreboard players enable @a tzz_leave_all_team

#初始化玩家呼叫管理员所需的计分板
scoreboard objectives add tzz_call_op trigger
scoreboard players enable @a tzz_call_op

#初始化op所需的高级计分板
scoreboard objectives add tzz_op_user_operation trigger
scoreboard players enable @a tzz_op_user_operation

#初始化死亡旁观者模式所需的记分板
scoreboard objectives add tzz_death_spectator deathCount
scoreboard players reset @a tzz_death_spectator
scoreboard players set switch tzz_death_spectator_switch 0

#初始化用于控制死亡旁观者模式开关的记分板
scoreboard objectives add tzz_death_spectator_switch trigger
scoreboard players enable @a tzz_death_spectator_switch

#初始化用于统计剩余玩家的计分板
scoreboard objectives add tzz_player_count dummy

#初始化用于开始游戏确认的计分板
scoreboard objectives add tzz_game_start_confirm trigger
scoreboard players enable @a tzz_game_start_confirm

#初始化用于开启游戏进程的计分板
scoreboard objectives add tzz_game_start_process trigger
scoreboard players enable @a tzz_game_start_process

#初始化用于展开文本内容的计分板
scoreboard objectives add tzz_text_expand trigger
scoreboard players enable @a tzz_text_expand

#初始化用于显示游戏规则的计分板
scoreboard objectives add tzz_show_game_rule trigger
scoreboard players enable @a tzz_show_game_rule

#初始化用于显示游戏指南的计分板
scoreboard objectives add tzz_show_game_guide trigger
scoreboard players enable @a tzz_show_game_guide

#初始化用于统计未分组玩家的计分板
scoreboard objectives add tzz_unassigned dummy

#初始化游戏内逃走能量的计分板
scoreboard objectives add tzz_run_energy dummy
scoreboard objectives modify tzz_run_energy displayname {text:"------=>逃走能量<=------",color:"#00BFFF"}

#清除计分板显示内容
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay sidebar.team.green
scoreboard objectives setdisplay sidebar.team.gold
#初始化统计猎人击杀数的计分板
scoreboard objectives add tzz_catcher_kill_count playerKillCount
scoreboard objectives modify tzz_catcher_kill_count displayname {text:"------=>猎人击杀数<=------",color:"#FF4500"}

#初始化检测玩家是否都已选择队伍后开启游戏的计分板
scoreboard objectives add tzz_team_check_done dummy
scoreboard players set Global tzz_team_check_done 0

#初始化游戏是否为开启状态的计分板
scoreboard objectives add tzz_game_active dummy
scoreboard players set Global tzz_game_active 0

# 当前任务编号（0=无，1/2/3/4...），用于控制任务专属检测/触发器
scoreboard objectives add tzz_current_task dummy
scoreboard players set Global tzz_current_task 0

# 初始化“出界检测”冷却（避免每tick刷屏/重复tp）
scoreboard objectives add tzz_boundary_cd dummy
scoreboard players reset @a tzz_boundary_cd

# 临时坐标记分板（供出界通知向 OP 显示整数坐标，避免小数位过多）
scoreboard objectives add tzz_tmp_x dummy
scoreboard objectives add tzz_tmp_z dummy
scoreboard players reset @a tzz_tmp_x
scoreboard players reset @a tzz_tmp_z

#初始化统计游戏人数的计分板
scoreboard objectives add tzz_player_number_load dummy
scoreboard objectives add tzz_player_number dummy
scoreboard players reset @a tzz_player_number_load
scoreboard players set Global tzz_player_number 0

#初始化玩家准备的计分板
scoreboard objectives add tzz_game_start_ready trigger
scoreboard players enable @a tzz_game_start_ready
scoreboard objectives add tzz_game_start_ready_check trigger
scoreboard players enable @a tzz_game_start_ready_check
scoreboard players reset @a tzz_game_start_ready

# trigger 计分板不能稳定作为 fake player 计数器/全局标记使用
# 用 dummy 计分板专门存“已准备人数计数”和“是否全员准备”的结果
scoreboard objectives add tzz_game_start_ready_cnt dummy
scoreboard players set player_numbers tzz_game_start_ready_cnt 0

scoreboard objectives add tzz_game_start_ready_ok dummy
scoreboard players set Global tzz_game_start_ready_ok 0

#初始化猎人选择出生点的计分板
scoreboard objectives add tzz_catcher_spawn_point trigger
scoreboard players enable @a tzz_catcher_spawn_point
scoreboard players reset @a tzz_catcher_spawn_point

#初始化猎人出生点占用锁/选择记录
scoreboard objectives add tzz_catcher_spawn_lock dummy
scoreboard objectives add tzz_catcher_spawn_selected dummy
scoreboard players reset @a tzz_catcher_spawn_selected

#初始化各出生点占用状态（0=可选，1=已被占用）
scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0
scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

#初始化起跑游戏1读秒器的计分板
scoreboard objectives add tzz_minigame_1_countdown dummy
scoreboard players set Global tzz_minigame_1_countdown 0
scoreboard objectives add tzz_minigame_1_timer dummy
scoreboard players set Global tzz_minigame_1_timer 0
scoreboard objectives add tzz_minigame_1_timer_small dummy
scoreboard players set Global tzz_minigame_1_timer_small 0
schedule clear tzz_game_running:gamestart_minigame_1/timer_run
schedule clear tzz_game_running:gamestart_minigame_1/small_timer_run
scoreboard objectives add tzz_minigame_1_ok dummy
scoreboard players set Global tzz_minigame_1_ok 0
tag @a remove tzz_minigame_1_runner_1
tag @a remove tzz_minigame_1_runner_2

#初始化任务一猎人箱封锁计分板
scoreboard objectives add tzz_task_one_catcher_chest_lock dummy
scoreboard players set yellow tzz_task_one_catcher_chest_lock 0
scoreboard players set purple tzz_task_one_catcher_chest_lock 0
scoreboard players set green tzz_task_one_catcher_chest_lock 0

#初始化玩家选择性别的计分板
scoreboard objectives add tzz_choose_gender trigger
scoreboard players reset @a tzz_choose_gender
scoreboard players enable @a tzz_choose_gender
tag @a remove tzz_gender_male
tag @a remove tzz_gender_female
tag @a remove certification_female_passed
tag @a remove certification_male_passed

#初始化OP actionbar计时器相关记分板
scoreboard objectives add tzz_op_timer_remaining dummy
scoreboard objectives add tzz_op_timer_tick dummy
scoreboard objectives add tzz_op_timer_math dummy
scoreboard players set Global tzz_op_timer_remaining 0
scoreboard players set Global tzz_op_timer_tick 0
scoreboard players set const_60 tzz_op_timer_math 60
scoreboard players set min tzz_op_timer_math 0
scoreboard players set sec tzz_op_timer_math 0
scoreboard players set tmp tzz_op_timer_math 0

#清除玩家effect
effect clear @a
tag @a remove death

#任务三检测猎人是否封锁的计分板
scoreboard objectives add tzz_task_3_catcher_lock dummy
scoreboard players set Global tzz_task_3_catcher_lock 0

#复活任务检测复活玩家数量的计分板 
scoreboard objectives add tzz_revive_count dummy
scoreboard players set Global tzz_revive_count 0