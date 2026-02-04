tellraw @a \
 [{text:"[",color:"#ffffff"},\
 {text:"任务四",color:"#ff0000"},\
 {text:"]",color:"#ffffff"},\
 {text:"\n你们获得了一个",color:"#ffffff"},\
 {text:"每秒增加逃走能量的机会",color:"#ffbb00"},\
 {text:",在",color:"#ffffff"},\
 {text:"安和居、小丑屋、旅游社",color:"#26ff00"},\
 {text:"各投放了一台",color:"#ffffff"},\
 {text:"奖励装置",color:"#ffe600"},\
 {text:",前两个人拉下装置会",color:"#ffffff"},\
 {text:"获得更多逃走能量",color:"#00ff99"},\
 {text:",装置时效为",color:"#ffffff"},\
 {text:"6分钟",color:"#ff00f7"}]

setblock -439 70 2244 minecraft:redstone_block
setblock -439 70 2244 minecraft:diamond_block
setblock -266 69 2145 minecraft:redstone_block
setblock -266 69 2145 minecraft:diamond_block
setblock -536 65 2007 minecraft:redstone_block
setblock -536 65 2007 minecraft:diamond_block

schedule function tzz_game_running:task_5/test_task_5 360s