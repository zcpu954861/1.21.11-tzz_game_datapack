setblock -376 80 2181 minecraft:stone_button[face=floor,facing=south]
fill -373 82 2165 -379 80 2165 glass
fill -373 82 2170 -379 80 2170 glass
fill -379 82 2169 -379 80 2166 glass
fill -373 82 2169 -373 80 2166 glass
tp @a[team=tzz_team_runner] -375.50 79.06 2168.00
tag @r[team=tzz_team_runner] add tzz_minigame_1_runner_1
tag @r[team=tzz_team_runner,tag=!tzz_minigame_1_runner_1] add tzz_minigame_1_runner_2

tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
{"text":"30s后开始起跑游戏!","color":"yellow"}]

tellraw @a [{"text":"[全员逃走中]","color":"gold"},\
{"text":"被随机选中的玩家如下:","color":"yellow"}]

tellraw @a [{"text":"            - ","color":"yellow"},\
{"selector":"@a[tag=tzz_minigame_1_runner_1]","color":"aqua"}]

tellraw @a [{"text":"            - ","color":"yellow"},\
{"selector":"@a[tag=tzz_minigame_1_runner_2]","color":"aqua"}]

tp @a[tag=tzz_minigame_1_runner_1] -375.5 79.06 2178.5

tellraw @a [{"text":"[起跑游戏]","color":"#26beff"}]
tellraw @a [{"text":"[读秒]","color":"#ff9900"},\
{"text":":随机抽取两个人上前进行读秒,前面有",color:"#ffffff"},\
{"text":"停止","color":"#ff0000"},\
{"text":"按钮,","color":"#ffffff"},\
{"text":"30秒","color":"#3cff00"},\
{"text":"后,系统将抽取随机秒数,请在心中预估显示的时间,",color:"#ffffff"},\
{"text":"并在对应时间按下",color:"#ffffff"},\
{"text":"停止按钮","color":"#ff0000"},\
{"text":",若秒数","color":"#ffffff"},\
{"text":"不正确","color":"#ff0000"},\
{"text":",则猎人",color:"#ffffff"},\
{"text":"立刻放出",color:"#a60000"},\
{"text":"!","color":"#ffffff"}]

schedule function tzz_game_running:gamestart_minigame_1/start 30s