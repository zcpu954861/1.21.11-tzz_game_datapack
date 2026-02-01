#用于显示开局前玩家准备界面
scoreboard players enable @a tzz_game_start_ready

tellraw @a [{text:""}]
tellraw @a [{text:""}]
tellraw @a [{text:""}]
tellraw @a [{text:""}]
tellraw @a [{text:""}]

tellraw @a [{text:"[全员逃走中]",color:"gold"},{text:"游戏进程准备就绪,请您准备!",color:"green"}]
tellraw @a [{text:"=========================",color:"aqua"}]
tellraw @a [{text:""}]
tellraw @a [{text:"• ",color:green},{text:"我准备好了!",color:green,\
click_event:{action:"run_command",command:"trigger tzz_game_start_ready set 1"}}]
tellraw @a [{text:""}]
tellraw @a [{text:"=========================",color:"aqua"}]
tellraw @a[tag=op] [{text:"[全员逃走中]",color:"gold"},\
{text:"游戏进程准备就绪,请您在玩家准备就绪后按下验证按钮!",color:"green"}]
tellraw @a[tag=op] [{text:"• ",color:green},{text:"验证是否全员准备",color:"aqua",\
click_event:{action:"run_command",command:"trigger tzz_game_start_ready_check"}}]
tellraw @a[tag=op] [{text:"• ",color:green},{text:"升起猎人箱",color:"red",\
click_event:{action:"run_command",command:"function tzz_game_running:gamestart_catcherbox_spawn/catcherbox_spawn_1"}}]