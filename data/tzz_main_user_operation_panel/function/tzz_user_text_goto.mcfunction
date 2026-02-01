
#本文件是用于显示游戏规则与指南文本内容的二级定向页面（统一新格式）
execute as @a[scores={tzz_text_expand=1..}] at @s run \
playsound block.stone_button.click_on master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_text_expand=1..}] at @s run \
tellraw @s [{text:"--------=>规则与指南<=--------",color:"#7FFFAA"}]

execute as @a[scores={tzz_text_expand=1..}] at @s run \
tellraw @s [{text:"========================",color:"aqua"}]

execute as @a[scores={tzz_text_expand=1..}] at @s run \
tellraw @s [{text:"• ",color:green},{text:"查看游戏规则",color:"#ADFF2F",\
"click_event":{"action":"run_command","command":"/trigger tzz_show_game_rule"},\
"hover_event":{"action":"show_text","value":{"text":"点击查看游戏规则","color":green}}}]

execute as @a[scores={tzz_text_expand=1..}] at @s run \
tellraw @s [{text:"• ",color:green},{text:"查看游戏指南",color:"#ADFF2F",\
"click_event":{"action":"run_command","command":"/trigger tzz_show_game_guide"},\
"hover_event":{"action":"show_text","value":{"text":"点击查看游戏指南","color":green}}}]

execute as @a[scores={tzz_text_expand=1..}] at @s run \
tellraw @s [{text:"========================",color:"aqua"}]

execute as @a[scores={tzz_text_expand=1..}] at @s run \
advancement grant @s only tzz_game:tzz_open_text

execute as @a[scores={tzz_text_expand=1..}] at @s run \
scoreboard players set @s tzz_text_expand 0

#检测显示游戏规则记分板分数,并显示游戏规则文本内容
execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
function tzz_main_user_operation_panel:tzz_game_rule