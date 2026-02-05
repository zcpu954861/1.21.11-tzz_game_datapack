#每秒为存活玩家增加1逃走能量
schedule function tzz_game:tzz_game_energy/tzz_game_energy 1s replace

scoreboard players add @a[team=tzz_team_runner,tag=!death] tzz_run_energy 20
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_1_1] tzz_run_energy 20
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_2_1] tzz_run_energy 20
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_3_1] tzz_run_energy 20
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_1_2] tzz_run_energy 18
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_2_2] tzz_run_energy 18
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_3_2] tzz_run_energy 18
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_1_3] tzz_run_energy 15
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_2_3] tzz_run_energy 15
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_5_triggered_3_3] tzz_run_energy 15
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_6_triggered_1_1] tzz_run_energy 20
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_6_triggered_2_1] tzz_run_energy 20
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_6_triggered_1_2] tzz_run_energy 15
scoreboard players add @a[team=tzz_team_runner,tag=!death,tag=task_6_triggered_2_2] tzz_run_energy 15
