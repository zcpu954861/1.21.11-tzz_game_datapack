#本文件用于将死亡的玩家转换为旁观者模式,并加上death标签,同时不针对op执行该操作
execute \
 if score switch tzz_death_spectator_switch matches 1 \
 as @a[scores={tzz_death_spectator=1..},tag=!op] \
 run gamemode spectator @s

execute \
 if score switch tzz_death_spectator_switch matches 1 \
 as @a[scores={tzz_death_spectator=1..},tag=!op] \
 run tag @s add death

#统计剩余逃走者并广播（仅当本tick有人死亡时执行一次）
execute \
 if score switch tzz_death_spectator_switch matches 1 \
 if entity @a[scores={tzz_death_spectator=1..},tag=!op] \
 run scoreboard players set Global tzz_player_count 0

execute \
 if score switch tzz_death_spectator_switch matches 1 \
 if entity @a[scores={tzz_death_spectator=1..},tag=!op] \
 run execute as @a[team=tzz_team_runner,tag=!op,tag=!death] \
 run scoreboard players add Global tzz_player_count 1

execute \
 if score switch tzz_death_spectator_switch matches 1 \
 as @a[scores={tzz_death_spectator=1..},tag=!op] \
 run tellraw @a [{"text":"[全员逃走中] ","color":"#ff0000"},\
 {"text":""},{"selector":"@s","color":"yellow"},{"text":" 被猎人抓捕!","color":"#ff0000"}]

execute \
 if score switch tzz_death_spectator_switch matches 1 \
 if entity @a[scores={tzz_death_spectator=1..},tag=!op] \
 run tellraw @a [{"text":"[全员逃走中]剩余玩家数: ","color":"#ff0000"},\
 {"score":{"name":"Global","objective":"tzz_player_count"},"color":"yellow"}]

#重置tzz_death_spectator记分板分数为0
execute \
 if score switch tzz_death_spectator_switch matches 1 \
 as @a[scores={tzz_death_spectator=1..},tag=!op] \
 run scoreboard players set @s tzz_death_spectator 0