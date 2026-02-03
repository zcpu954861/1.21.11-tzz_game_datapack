#本文件用于游戏开始前的确认操作
execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @s [{text:"[全员逃走中]",color:"gold"},{text:"你确定要开始游戏吗？",color:"aqua"}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"点击确认开始游戏",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_game_start_process"},\
 hover_event:{action:"show_text",value:{text:"点击确认开始游戏",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @s [{text:"如果你不想开始游戏,请关闭此提示框即可。",color:"yellow"}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 playsound block.note_block.pling master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @s [{text:"注意:一旦游戏开始,将不能随意停止!","color":"#ff0000"}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @s [{text:"在游戏开始后重载数据包会导致数据完全清零,地图完全重置!","color":"#ff0000"}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @s [{text:"在检查完毕数据包正常后,您可以开始游戏!","color":"#ff0000"}]

#为猎人玩家显示出生位置选择
execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_A tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_B tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_C tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_D tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_E tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_F tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_G tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_H tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set tzz_spawn_I tzz_catcher_spawn_lock 0

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players reset @a[team=tzz_team_catcher] tzz_catcher_spawn_selected

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[全员逃走中]",color:"gold"},\
 {text:"请猎人选择部署位置:",color:"aqua"}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[首发-右侧]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 1"},\
 hover_event:{action:"show_text",value:{text:"选择首发位置-右侧",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[首发-中间]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 2"},\
 hover_event:{action:"show_text",value:{text:"选择首发位置-中间",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[首发-左侧]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 3"},\
 hover_event:{action:"show_text",value:{text:"选择首发位置-左侧",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[任务一真猎人(紫色)]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 4"},\
 hover_event:{action:"show_text",value:{text:"选择出生位置D",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[任务一真猎人(黄色)]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 5"},\
 hover_event:{action:"show_text",value:{text:"选择出生位置E",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[任务一真猎人(绿色)]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 6"},\
 hover_event:{action:"show_text",value:{text:"选择出生位置F",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[任务一假猎人(绿色)(任务三飞天)]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 7"},\
 hover_event:{action:"show_text",value:{text:"选择出生位置G",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[任务一假猎人(黄色)]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 8"},\
 hover_event:{action:"show_text",value:{text:"选择出生位置H",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[任务一假猎人(紫色)]",color:"green",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 9"},\
 hover_event:{action:"show_text",value:{text:"选择出生位置I",color:green}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{text:"[取消已选位置]",color:"yellow",\
 click_event:{action:"run_command",command:"/trigger tzz_catcher_spawn_point set 99"},\
 hover_event:{action:"show_text",value:{text:"取消你当前已选择的出生位置",color:yellow}}}]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 tellraw @a[team=tzz_team_catcher] \
 [{"text":"=","color":"#f093fb"},{"text":"=","color":"#f090f0"},{"text":"=","color":"#f18de5"},\
 {"text":"=","color":"#f18ada"},{"text":"=","color":"#f187cf"},{"text":"=","color":"#f284c4"},\
 {"text":"=","color":"#f281b9"},{"text":"=","color":"#f27eae"},{"text":"=","color":"#f37ba3"},\
 {"text":"=","color":"#f37898"},{"text":"=","color":"#f3758d"},{"text":"=","color":"#f47282"},\
 {"text":"=","color":"#f46f77"},{"text":"=","color":"#f46c6c"},{"text":"=","color":"#f56961"},\
 {"text":"=","color":"#f56656"},{"text":"=","color":"#f5634b"},{"text":"=","color":"#f56040"},\
 {"text":"=","color":"#f55d35"},{"text":"=","color":"#f55a2a"},{"text":"=","color":"#f5571f"},\
 {"text":"=","color":"#f55724"},{"text":"=","color":"#f55729"},{"text":"=","color":"#f5572e"},\
 {"text":"=","color":"#f5576c"},]

execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 gamemode spectator @a[team=tzz_team_catcher]

#重置玩家的tzz_game_start_confirm记分板分数
execute as @a[scores={tzz_game_start_confirm=1..}] at @s run \
 scoreboard players set @s tzz_game_start_confirm 0