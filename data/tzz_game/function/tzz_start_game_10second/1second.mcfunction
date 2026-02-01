playsound block.note_block.bell master @a ~ ~ ~ 1 1 1

tellraw @a [{"text":"[全员逃走中] ","color":"gold"},{"text":"一秒后游戏开始!","color":"#FF8C00"}]

schedule function tzz_game:tzz_start_game_10second/0second_start 1s