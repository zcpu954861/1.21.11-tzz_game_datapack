#用于显示开局前玩家准备界面
scoreboard players enable @a tzz_game_start_ready

tellraw @a [{text:""}]
tellraw @a [{text:""}]
tellraw @a [{text:""}]
tellraw @a [{text:""}]
tellraw @a [{text:""}]

tellraw @a [{text:"[全员逃走中]",color:"gold"},{text:"游戏进程准备就绪,请您准备!",color:"green"}]
tellraw @a [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]
tellraw @a [{text:""}]
tellraw @a [{text:"• ",color:green},{text:"我准备好了!",color:green,\
 click_event:{action:"run_command",command:"trigger tzz_game_start_ready set 1"}}]
tellraw @a [{text:""}]
tellraw @a [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]
tellraw @a[tag=op] [{text:"[全员逃走中]",color:"gold"},\
 {text:"游戏进程准备就绪,请您在玩家准备就绪后按下验证按钮!",color:"green"}]
tellraw @a[tag=op] [{text:"• ",color:green},{text:"验证是否全员准备",color:"aqua",\
 click_event:{action:"run_command",command:"trigger tzz_game_start_ready_check"}}]
tellraw @a[tag=op] [{text:"• ",color:green},{text:"升起猎人箱","color":"#ff0000",\
 click_event:{action:"run_command",command:"function tzz_game_running:gamestart_catcherbox_spawn/catcherbox_spawn_1"}}]