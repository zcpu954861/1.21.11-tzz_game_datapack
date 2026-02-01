function tzz_game:tzz_config/task_one/catcher_fx

execute if score green tzz_task_one_catcher_chest_lock matches 0 run function tzz_game:tzz_config/task_one/open_green_door
execute if score yellow tzz_task_one_catcher_chest_lock matches 0 run function tzz_game:tzz_config/task_one/open_yellow_door
execute if score purple tzz_task_one_catcher_chest_lock matches 0 run function tzz_game:tzz_config/task_one/open_purple_door