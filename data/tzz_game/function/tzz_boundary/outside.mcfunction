# 玩家出界处理
# 不传送：只提示玩家，并通知管理员(op)

# 冷却中则不重复处理
execute unless score @s tzz_boundary_cd matches 1.. run \
 title @s actionbar {"text":"你已离开可活动区域（请返回地图内）","color":"red"}

# 存储整数坐标到临时记分板，便于向 OP 显示没有长小数
execute unless score @s tzz_boundary_cd matches 1.. run \
 execute store result score @s tzz_tmp_x run data get entity @s Pos[0] 1
execute unless score @s tzz_boundary_cd matches 1.. run \
 execute store result score @s tzz_tmp_z run data get entity @s Pos[2] 1

execute unless score @s tzz_boundary_cd matches 1.. run \
 tellraw @a[tag=op] [{"text":"[全员逃走中] ","color":"gold"},\
 {"text":"出界警报：","color":"red"},\
 {"selector":"@s","color":"yellow"},\
 {"text":" 位置(x,z)=","color":"gray"},\
 {"score":{"name":"@s","objective":"tzz_tmp_x"},"color":"aqua"},\
 {"text":", ","color":"gray"},\
 {"score":{"name":"@s","objective":"tzz_tmp_z"},"color":"aqua"}]
execute unless score @s tzz_boundary_cd matches 1.. run \
 playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.8

execute unless score @s tzz_boundary_cd matches 1.. run \
 scoreboard players set @s tzz_boundary_cd 20
