tellraw @a [{"text":"["},\
 {"text":"任务一","color":"#ff0000"},\
 {"text":"]",},\
 {"text":"\n在",},\
 {"text":"市场内","color":"#ff0000"},\
 {"text":"投放了"},\
 {"text":"3台猎人箱","color":"#ff0000"},\
 {"text":",猎人将在",},\
 {"text":"15分钟后放出","color":"#a60000"},\
 {"text":"\n每台猎人箱旁都"},\
 {"text":"标注着相应的颜色","color":"#ff0000"},\
 {"text":",而封锁猎人箱需要"},\
 {"text":"将对应颜色的色卡投入即可封锁","color":"#ff0000"},\
 {"text":"\n同时,游戏区域投放了"},\
 {"text":"3具假猎人","color":"#ff0000"},\
 {"text":",假猎人"},\
 {"text":"没有抓捕功能","color":"#a60000"},\
 {"text":",站在"},\
 {"text":"假猎人面前3秒即可获得色卡","color":"gold"},\
 {"text":",每具假猎人"},\
 {"text":"身上的色卡都为固定颜色","color":"#ff0000"}]

# OP计时器：15分钟后进行任务一结算/猎人箱判定
data modify storage tzz_game:op_timer event set value "任务一结算(猎人箱判定)"
scoreboard players set Global tzz_op_timer_remaining 900

function tzz_game_running:task_one/build_catcher_box

schedule function tzz_game_running:task_one/test_task_one 900s