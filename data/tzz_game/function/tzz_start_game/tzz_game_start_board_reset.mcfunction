#本文件用于重置游戏的关键计分板,保证游戏开始后正常运行
scoreboard players reset @a tzz_death_spectator

scoreboard players set switch tzz_death_spectator_switch 1

#统计玩家总数
scoreboard players add @a tzz_player_number_load 1

scoreboard players set Global tzz_player_number 0

execute as @a[scores={tzz_player_number_load=1..}] at @s \
run scoreboard players add Global tzz_player_number 1

tellraw @a [{"text":"[全员逃走中] ",color:"gold"},\
{text:"当前玩家数量: ",color:"yellow"},\
{score:{"objective":"tzz_player_number",name:"Global"},color:"green"}]
 
playsound entity.villager.yes master @a ~ ~ ~ 1 1 1

function tzz_game:tzz_start_game/tzz_game_start_ready