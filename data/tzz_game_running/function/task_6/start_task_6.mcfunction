#[任务五]
#你们获得了两个任务,需要在其中挑选一个完成,需要在以下两点间运送物品:
#- 马戈尔的大厦 → 纪念品商店    (存储饰品的盒子)
#- 治疗中心 → 唱片店           (节奏舒缓的唱片)
#作为酬劳,将货物送至指定地点后每秒将得到更多的逃走能量,每个任务的最快者可以获得更多奖励
#如果在10分钟内没有送达,则视为任务失败,将会扣除一部分逃走能量

tellraw @a [{"text":"[","color":"#ffffff"},\
 {text:"任务五","color":"#ff0000"},\
 {text:"]","color":"#ffffff"},\
 {text:"\n你们获得了",color:"#ffffff"},\
 {text:"两个任务",color:"#ffbb00"},\
 {text:",需要在其中",color:"#ffffff"},\
 {text:"挑选一个完成",color:"#00ff99"},\
 {text:",需要在以下",color:"#ffffff"},\
 {text:"两点间运送物品:",color:"#26ff00"},\
 {text:"\n- 马戈尔的大厦 → 纪念品商店",color:"#00ddff"},\
 {text:"    (存储饰品的盒子)",color:"#ffaa00"},\
 {text:"\n- 治疗中心 → 唱片店",color:"#00ddff"},\
 {text:"             (节奏舒缓的唱片)",color:"#ffaa00"},\
 {text:"\n作为酬劳,将货物送至",color:"#ffffff"},\
 {text:"指定地点",color:"#26ff00"},\
 {text:"后每秒将得到",color:"#ffffff"},\
 {text:"更多的逃走能量",color:"#009dff"},\
 {text:",每个任务的",color:"#ffffff"},\
 {text:"最快者",color:"#00ff99"},\
 {text:"可以获得更多奖励",color:"#ffbb00"},\
 {text:"\n如果在",color:"#ffffff"},\
 {text:"10分钟",color:"#ff00f7"},\
 {text:"内没有送达",color:"#ffffff"},\
 {text:",则视为任务失败,",color:"#ff0000"},\
 {text:"将会扣除一部分逃走能量",color:"#ffffff"}]

setblock -534 76 2054 minecraft:redstone_block
setblock -534 76 2054 minecraft:diamond_block
setblock -239 71 2131 minecraft:redstone_block
setblock -239 71 2131 minecraft:diamond_block
setblock -390 67 1973 minecraft:redstone_block
setblock -390 67 1973 minecraft:diamond_block
setblock -225 63 2224 minecraft:redstone_block
setblock -225 63 2224 minecraft:diamond_block

# OP计时器：10分钟后任务五判定
data modify storage tzz_game:op_timer event set value "任务五判定(未送达扣能量)"
scoreboard players set Global tzz_op_timer_remaining 600

schedule function tzz_game_running:task_6/test_task_6 600s