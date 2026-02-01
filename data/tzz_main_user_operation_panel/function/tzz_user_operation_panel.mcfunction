#本文件用于显示玩家用户操作面板

#当玩家的tzz_user_operation记分板分数为1或更高时，显示用户操作面板信息
execute as @a[scores={tzz_user_operation=1..}] at @s run \
 playsound block.stone_button.click_on master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"--------=>玩家面板<=--------",color:"#7FFFAA"}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"========================",color:"aqua"}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"加入逃走者",color:"#BFFF00",\
 "click_event":{"action":"run_command","command":"/trigger tzz_join_runner"},\
 "hover_event":{"action":"show_text","value":{"text":"点击加入逃走者队伍","color":green}}}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"加入猎人",color:"#BFFF00",\
 "click_event":{"action":"run_command","command":"/trigger tzz_join_catcher"},\
 "hover_event":{"action":"show_text","value":{"text":"点击加入猎人队伍","color":green}}}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"离开队伍",color:"#FF1493",\
 "click_event":{"action":"run_command","command":"/trigger tzz_leave_all_team"},\
 "hover_event":{"action":"show_text","value":{"text":"点击离开全部队伍","color":green}}}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"选择男生",color:"#00c8ff",\
 "click_event":{"action":"run_command","command":"/trigger tzz_choose_gender set 1"},\
 "hover_event":{"action":"show_text","value":{"text":"点击选择男生","color":green}}}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"选择女生",color:"#ff61f2",\
 "click_event":{"action":"run_command","command":"/trigger tzz_choose_gender set 2"},\
 "hover_event":{"action":"show_text","value":{"text":"点击选择女生","color":green}}}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"呼叫管理员",color:"#FF4500",\
 "click_event":{"action":"run_command","command":"/trigger tzz_call_op"},\
 "hover_event":{"action":"show_text","value":{"text":"如果被困或有问题请点击","color":green}}}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"• ",color:green},{text:"游戏规则/指南",color:"aqua",\
 click_event:{"action":"run_command","command":"/trigger tzz_text_expand"},\
 hover_event:{"action":"show_text","value":{"text":"点击查看游戏规则与指南","color":green}}}]

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 tellraw @s [{text:"========================",color:"aqua"}]


execute as @a[scores={tzz_user_operation=1..}] at @s run \
 advancement grant @s only tzz_game:tzz_use_command

execute as @a[scores={tzz_user_operation=1..}] at @s run \
 advancement grant @s only tzz_game:tzz_energy

#当玩家使用后，重置其tzz_user_operation记分板分数为0
execute as @a[scores={tzz_user_operation=1..}] at @s run \
 scoreboard players set @s tzz_user_operation 0

#检测加入逃走者计分板分数,并将玩家加入逃走者队伍,最后重置记分板分数
execute as @a[scores={tzz_join_runner=1..}] at @s run \
 team join tzz_team_runner @s

execute as @a[scores={tzz_join_runner=1..}] at @s run \
 advancement grant @s only tzz_game:tzz_choose_team

execute as @a[scores={tzz_join_runner=1..}] at @s run \
 playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.6 1.8

execute as @a[scores={tzz_join_runner=1..}] at @s run \
 tellraw @s [{text:"[全员逃走中]",color:"gold"},{text:"你已成功加入逃走者队伍！",color:"green"}]

execute as @a[scores={tzz_join_runner=1..}] if score Global tzz_game_active matches 1 at @s run \
 tellraw @a[tag=op] [{"text":"[全员逃走中]",color:"gold"},\
 {"text":"管理员注意:",color:"red"},\
 {"text":"玩家 ","color":"yellow"},\
 {"selector":"@s","color":"aqua"},\
 {"text":"在游戏进程中加入逃走者队伍","color":"yellow"}]

execute as @a[scores={tzz_join_runner=1..}] at @s run \
 scoreboard players set @s tzz_join_runner 0

#检测加入猎人计分板分数,并将玩家加入猎人队伍,最后重置记分板分数
execute as @a[scores={tzz_join_catcher=1..}] at @s run \
 team join tzz_team_catcher @s

execute as @a[scores={tzz_join_catcher=1..}] at @s run \
 advancement grant @s only tzz_game:tzz_choose_team

execute as @a[scores={tzz_join_catcher=1..}] at @s run \
 playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.6 1.8

execute as @a[scores={tzz_join_catcher=1..}] at @s run \
 tellraw @s [{text:"[全员逃走中]",color:"gold"},{text:"你已成功加入猎人队伍！",color:"green"}]

execute as @a[scores={tzz_join_catcher=1..}] if score Global tzz_game_active matches 1 at @s run \
 tellraw @a[tag=op] [{"text":"[全员逃走中]",color:"gold"},\
 {"text":"管理员注意:",color:"red"},\
 {"text":"玩家 ","color":"yellow"},\
 {"selector":"@s","color":"aqua"},\
 {"text":"在游戏进程中加入猎人队伍","color":"yellow"}]

execute as @a[scores={tzz_join_catcher=1..}] at @s run \
 scoreboard players set @s tzz_join_catcher 0

#检测离开全部队伍计分板分数,并将玩家移出全部队伍,最后重置记分板分数
execute as @a[scores={tzz_leave_all_team=1..}] at @s run \
 team leave @s

execute as @a[scores={tzz_leave_all_team=1..}] at @s run \
 scoreboard players set @s tzz_leave_all_team 0

#检测呼叫管理员计分板分数,并向所有op玩家发送消息,最后重置记分板分数
execute as @a[scores={tzz_call_op=1..}] at @s run \
 tellraw @a[tag=op] [{"text":"[全员逃走中] ","color":"red"},\
 {"text":"玩家 ","color":"yellow"},\
 {"selector":"@s","color":"aqua"},\
 {"text":"需要帮助！","color":"yellow"}]

execute as @a[scores={tzz_call_op=1..}] at @s run \
 playsound minecraft:block.bell.use master @a[tag=op] ~ ~ ~ 1 1 1

execute as @a[scores={tzz_call_op=1..}] at @s run \
 scoreboard players set @s tzz_call_op 0

#检测展开文本记分板分数,并显示游戏规则与指南二级页面
execute as @a[scores={tzz_text_expand=1..}] at @s run \
 function tzz_main_user_operation_panel:tzz_user_text_goto

#检测性别选择记分板分数,并设置玩家性别属性,最后重置记分板分数
execute as @a[scores={tzz_choose_gender=1}] at @s run \
 tag @s add tzz_gender_male
execute as @a[scores={tzz_choose_gender=1}] at @s run \
 tag @s remove tzz_gender_female
execute as @a[scores={tzz_choose_gender=1}] at @s run \
 tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":" 你已选择男生身份！","color":"#00c8ff"}]
execute as @a[scores={tzz_choose_gender=1}] at @s run \
 scoreboard players set @s tzz_choose_gender 0

execute as @a[scores={tzz_choose_gender=2}] at @s run \
 tag @s add tzz_gender_female
execute as @a[scores={tzz_choose_gender=2}] at @s run \
 tag @s remove tzz_gender_male
execute as @a[scores={tzz_choose_gender=2}] at @s run \
 tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":" 你已选择女生身份！","color":"#ff61f2"}]
execute as @a[scores={tzz_choose_gender=2}] at @s run \
 scoreboard players set @s tzz_choose_gender 0