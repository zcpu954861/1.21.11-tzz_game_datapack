#每秒为存活玩家增加1逃走能量
schedule function tzz_game:tzz_game_energy/tzz_game_energy 1s

scoreboard players add @a[team=tzz_team_runner,tag=!death] tzz_run_energy 20
