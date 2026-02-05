#重置逃走能量计分板
scoreboard players reset @a tzz_run_energy
scoreboard objectives setdisplay sidebar.team.gold tzz_run_energy
schedule function tzz_game:tzz_game_energy/tzz_game_energy 1s replace