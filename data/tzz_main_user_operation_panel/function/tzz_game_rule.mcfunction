#本文件用于显示游戏规则（统一新格式）
execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
playsound block.stone_button.click_on master @s ~ ~ ~ 1 1 1

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
tellraw @s [{text:"--------=>游戏规则<=--------",color:"#7FFFAA"}]

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
tellraw @s [{text:"========================",color:"aqua"}]

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
tellraw @s [{text:"• ",color:"yellow"},{text:"玩家不得上房顶、爬树、下水、跑酷",color:"#B0C4DE"}]

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
tellraw @s [{text:"• ",color:"yellow"},{text:"严禁在游玩时更改队伍，管理员会收到提示",color:"#B0C4DE"}]

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
tellraw @s [{text:"========================",color:"aqua"}]

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
tellraw @s [{text:"• ",color:green},{text:"确认已知悉",color:"red",\ 
"click_event":{"action":"run_command","command":"/tellraw @a [\"\",{\"text\":\"玩家 \",\"color\":\"yellow\"},\
{\"selector\":\"@s\",\"color\":\"aqua\"},{\"text\":\" 已阅读完毕游戏规则！\",\"color\":\"green\"}]"},\
"hover_event":{"action":"show_text","value":{"text":"点击确认你已阅读完规则","color":green}}}]

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
tellraw @s [{text:"• ",color:green},{text:"返回主面板",color:"aqua",\
"click_event":{"action":"run_command","command":"/trigger tzz_user_operation"},\
"hover_event":{"action":"show_text","value":{"text":"点击返回主面板","color":green}}}]

execute as @a[scores={tzz_show_game_rule=1..}] at @s run \
scoreboard players set @s tzz_show_game_rule 0

