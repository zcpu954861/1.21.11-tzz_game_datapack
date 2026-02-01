#本文件用于触发定时任务

#移除定时项目
schedule clear tzz_game:tzz_game_energy/tzz_game_energy

#添加定时项目
schedule function tzz_scheduled_tasks:tzz_global_broadcast 60s
schedule function tzz_initialize:tzz_initialize_ok 1s