#本文件用于显示管理员用户的操作面板

#当记分板tzz_op_user_operation的值为1时，打开管理员用户操作面板
execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 playsound block.stone_button.click_on master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @s [{text:"-------=>管理员面板<=-------",color:"gold"}]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @a [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"查看猎人玩家列表",color:"yellow",\
 click_event:{action:"run_command",command:"/team list tzz_team_catcher"},\
 hover_event:{action:"show_text",value:{text:"点击查看当前所有猎人玩家的列表",color:green}}}]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"查看逃走者玩家列表",color:"yellow",\
 click_event:{action:"run_command",command:"/team list tzz_team_runner"},\
 hover_event:{action:"show_text",value:{text:"点击查看当前所有逃走者玩家的列表",color:green}}}]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"清空玩家死亡数据",color:"#FF8C00",\
 click_event:{action:"run_command",command:"/scoreboard players reset @a[scores={tzz_death_spectator=1..}] tzz_death_spectator"},\
 hover_event:{action:"show_text",value:{text:"点击清空所有玩家的死亡数据",color:green}}}]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"开启死亡旁观者模式",color:"red",\
 click_event:{action:"run_command",command:"/scoreboard players set switch tzz_death_spectator_switch 1"},\
 hover_event:{action:"show_text",value:{text:"点击开启死亡旁观者模式",color:green}}}]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"关闭死亡旁观者模式",color:"green",\
 click_event:{action:"run_command",command:"/scoreboard players set switch tzz_death_spectator_switch 0"},\
 hover_event:{action:"show_text",value:{text:"点击关闭死亡旁观者模式",color:green}}}]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"开始游戏",color:"#1E90FF",\
 click_event:{action:"run_command",command:"/trigger tzz_game_start_confirm"},\
 hover_event:{action:"show_text","value":{"text":"点击开始游戏","color":green}}}]

execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 tellraw @a [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]

#当玩家使用后，重置其tzz_op_user_operation记分板分数为0
execute as @a[scores={tzz_op_user_operation=1..}] at @s run \
 scoreboard players set @s tzz_op_user_operation 0

#游戏开始按钮按下检测
execute as @a[scores={tzz_game_start_confirm=1..}] at @s run function tzz_game:tzz_start_game/tzz_startgame_confirm

#设置op的tag的用户加入op管理员队伍
execute as @a[tag=op] at @s run team join tzz_team_op @s