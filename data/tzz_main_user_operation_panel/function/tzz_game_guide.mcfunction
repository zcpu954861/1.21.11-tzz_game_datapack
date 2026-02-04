
#本文件用于显示游戏指南（统一新格式）
execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 playsound block.stone_button.click_on master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 tellraw @s [{text:"--------=>游戏指南<=--------",color:"#7FFFAA"}]

execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 tellraw @s [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]


execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 tellraw @s [{text:"• ",color:"yellow"},{text:"按下F3键可以查看自己面向的方向!",color:"#B0C4DE"}]

execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 tellraw @s [{text:"• ",color:"yellow"},{text:"与其他逃走者合作进行任务更效率!",color:"#B0C4DE"}]

execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 tellraw @s [{text:"• ",color:"yellow"},{text:"获取最多的逃走能量以获得游戏胜利!",color:"#B0C4DE"}]

execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 tellraw @s [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]


execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"返回主面板",color:"aqua",\
 "click_event":{"action":"run_command","command":"/trigger tzz_user_operation"},\
 "hover_event":{"action":"show_text","value":{"text":"点击返回主面板","color":green}}}]

execute as @a[scores={tzz_show_game_guide=1..}] at @s run \
 scoreboard players set @s tzz_show_game_guide 0