#用于全局广播
schedule function tzz_scheduled_tasks:tzz_global_broadcast 60s

tellraw @a \
 [{text:"[全员逃走中] ","color":"gold"},{"text":"游戏遇到问题?","color":"red"},{"text":" 请点击下方按钮寻求帮助!","color":"gold"}]

tellraw @a \
 [{text:"==========================","color":"green"}]

tellraw @a [{text:"• ",color:green},{text:"呼叫管理员",color:"#FF4500",\
 "click_event":{"action":"run_command","command":"/trigger tzz_call_op"},\
 "hover_event":{"action":"show_text","value":{"text":"如果被困或有问题请点击","color":green}}}]

tellraw @a \
 [{text:"==========================","color":"green"}]

