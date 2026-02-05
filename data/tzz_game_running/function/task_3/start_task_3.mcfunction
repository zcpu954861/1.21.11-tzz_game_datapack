tellraw @a [{text:"[",color:"#ffffff"},\
 {text:"任务三",color:"#ff0000"},\
 {text:"]",color:"#ffffff"},\
 {text:"\n现在,空中有",color:"#ffffff"},\
 {text:"通报猎人",color:"#a60000"},\
 {text:",逃走者一旦被",color:"#ffffff"},\
 {text:"通报猎人",color:"#a60000"},\
 {text:"发现将立即将",color:"#ffffff"},\
 {text:"位置信息",color:"#12d600"},\
 {text:"同步到地面猎人进行",color:"#ffffff"},\
 {text:"定位抓捕",color:"#ff0000"},\
 {text:",想要解除，逃走者需要找到图片里的位置进行",color:"#ffffff"},\
 {text:"解除",color:"#12d600"},\
 {text:",若",color:"#ffffff"},\
 {text:"解除成功",color:"#12d600"},\
 {text:",则立即移除",color:"#ffffff"},\
 {text:"通报猎人",color:"#a60000"},\
 {text:",若",color:"#ffffff"},\
 {text:"没有移除",color:"#ff0000"},\
 {text:",",color:"#ffffff"},\
 {text:"通报猎人",color:"#a60000"},\
 {text:"将持续到",color:"#ffffff"},\
 {text:"游戏结束",color:"#12d600"}]

tp @a[scores={tzz_catcher_spawn_selected=7}] -375.5 75.00 2130.50
gamemode creative @a[scores={tzz_catcher_spawn_selected=7}]

setblock -372 71 2070 minecraft:redstone_block
setblock -372 71 2070 minecraft:diamond_block

# OP计时器：10分钟后进行任务三阶段判定
data modify storage tzz_game:op_timer event set value "任务三判定(通报猎人封锁)"
scoreboard players set Global tzz_op_timer_remaining 600

schedule function tzz_game_running:task_3/test_task_3 600s