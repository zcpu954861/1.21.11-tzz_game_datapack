execute if score Global tzz_task_6_2_triggered_count matches 0 run \
 tag @p[tag=!task_6_triggered_2,distance=..5] add task_6_triggered_2_1

execute if score Global tzz_task_6_2_triggered_count matches 1.. run \
 tag @p[tag=!task_6_triggered_2,distance=..5] add task_6_triggered_2_2

tellraw @p[tag=!task_6_triggered_2,distance=..5] [{text:"[全员逃走中]",color:"gold"},\
{text:" 你成功运送了物品!",color:"#00ff00"}]

tellraw @p[tag=task_6_triggered_2,distance=..5] [{text:"[全员逃走中]",color:"gold"},\
{text:" 你已经运送过了!",color:"#ff0000"}]

execute if entity @p[tag=!task_6_triggered_2,distance=..5] run \
scoreboard players add Global tzz_task_6_2_triggered_count 1

tag @p[tag=!task_6_triggered_2,distance=..5] add task_6_triggered_2
