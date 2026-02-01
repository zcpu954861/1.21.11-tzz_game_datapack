scoreboard players add Global tzz_minigame_1_timer_small 5

execute if score Global tzz_minigame_1_timer_small matches 100 run \
 scoreboard players set Global tzz_minigame_1_timer_small 0

execute if score Global tzz_minigame_1_timer matches ..3 run \
 title @a actionbar [{"text":"时间: ","color":"yellow"},\
 {"score":{"name":"Global","objective":"tzz_minigame_1_timer"},"color":"aqua",bold:true},\
 {"text":" : ","color":"yellow"},\
 {"score":{"name":"Global","objective":"tzz_minigame_1_timer_small"},"color":"aqua",bold:true},\
 {"text":" 秒","color":"yellow"}]

execute if score Global tzz_minigame_1_timer matches 3.. run \
 title @a actionbar [{"text":"时间: ","color":"yellow"},\
 {"text":"§k11","color":"red"},\
 {"text":" : ","color":"yellow"},\
 {"text":"§k11","color":"red"},\
 {"text":" 秒","color":"yellow"}]

schedule function tzz_game_running:gamestart_minigame_1/small_timer_run 1t