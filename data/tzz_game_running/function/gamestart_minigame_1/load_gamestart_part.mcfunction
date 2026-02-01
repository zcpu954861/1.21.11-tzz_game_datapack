function tzz_game:tzz_config/gamestart/stop_button_place
function tzz_game:tzz_config/gamestart/arena_fill_glass
function tzz_game:tzz_config/gamestart/tp_all_runners_start
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

function tzz_game:tzz_config/gamestart/tp_runner_1_front

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