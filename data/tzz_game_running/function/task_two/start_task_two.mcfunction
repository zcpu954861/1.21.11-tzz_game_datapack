tellraw @a [{"text":"["},\
 {"text":"任务二","color":"#ff0000"},\
 {"text":"]"},\
 {"text":"\n10分钟后","color":"#ff0000"},\
 {"text":"将进行"},\
 {"text":"定位抓捕","color":"#a60000"},\
 {"text":",想要解除身上的"},\
 {"text":"定位装置","color":"#f6ff00"},\
 {"text":",需前往"},\
 {"text":"和悦里","color":"#12d600"},\
 {"text":"、"},\
 {"text":"图书馆","color":"#1362ff"},\
 {"text":"进行"},\
 {"text":"认证","color":"#12d600"},\
 {"text":",时间结束后没有认证成功的逃走队员身上会有"},\
 {"text":"发光效果","color":"gold"},\
 {"text":"吸引猎人"},\
 {"text":"抓捕","color":"#ff0000"}]

# OP计时器：10分钟后触发定位抓捕
data modify storage tzz_game:op_timer event set value "定位抓捕(未认证发光)"
scoreboard players set Global tzz_op_timer_remaining 600

schedule function tzz_game_running:task_two/test_task_two 600s