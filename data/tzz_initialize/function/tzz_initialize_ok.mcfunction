#本文件用于在数据包被加载时显示欢迎信息与操作引导

#显示数据包是否成功加载
tellraw @a ["",{"text":"[全员逃走中v2.3] ","color":"gold"},\
 {"text":"数据包加载成功！","color":"green"}]

#播放加载成功音效
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 0.6 1.8

#显示欢迎信息
tellraw @a [{"text":"欢迎使用全员逃走中数据包v2.3！","color":"yellow","italic":true}]
tellraw @a [{"text":"作者:zhan_cpu","color":"yellow","italic":true}]
tellraw @a [{"text":"=========================","color":"green"}]

#为op玩家显示前往管理员面板的按钮
tellraw @a[tag=op] \
 [{text:"• ",color:green},{"text":"管理员面板","color":"aqua","bold":false,"underlined":false,\
 "click_event":{"action":"run_command","command":"/trigger tzz_op_user_operation"}}]

#为玩家显示前往玩家面板的按钮
tellraw @a \
 [{text:"• ",color:green},{"text":"玩家面板","color":"aqua","bold":false,"underlined":false,\
 "click_event":{"action":"run_command","command":"/trigger tzz_user_operation"}}]

tellraw @a [{"text":"=========================","color":"green"}]


#显示数据包警告信息
tellraw @a \
 [{"text":"注意：请在游戏开始前使用\"/reload\"重载本数据包,以确保数据包工作正常！","color":"red"}]

tellraw @a \
 [{"text":"如需使用op功能,请使用\"/tag @s add op\",并重载数据包","color":"red"}]

tellraw @a \
 [{"text":"本数据包无法加载xaero's小地图的状态效果,请自行使用命令方块","color":"red"}]
