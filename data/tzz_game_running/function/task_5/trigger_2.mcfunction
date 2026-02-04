execute if score Global tzz_task_5_2_triggered_count matches 0 run \
 tag @p[tag=!task_5_triggered_2,distance=..3] add task_5_triggered_2_1

execute if score Global tzz_task_5_2_triggered_count matches 1 run \
 tag @p[tag=!task_5_triggered_2,distance=..3] add task_5_triggered_2_2

execute if score Global tzz_task_5_2_triggered_count matches 2.. run \
 tag @p[tag=!task_5_triggered_2,distance=..3] add task_5_triggered_2_3

tellraw @p[tag=!task_5_triggered_2,distance=..3] [{text:"[全员逃走中]",color:"gold"},\
{text:" 你触发了装置,可以继续触发其他装置!",color:"#00ff00"}]

tellraw @p[tag=task_5_triggered_2,distance=..3] [{text:"[全员逃走中]",color:"gold"},\
{text:" 你已经触发过该装置,只可以触发未触发过的装置!",color:"#ff0000"}]

execute if entity @p[tag=!task_5_triggered_2,distance=..3] run \
scoreboard players add Global tzz_task_5_2_triggered_count 1

tag @p[tag=!task_5_triggered_2,distance=..3] add task_5_triggered_2
