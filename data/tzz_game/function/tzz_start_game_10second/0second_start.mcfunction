playsound entity.player.levelup master @a ~ ~ ~ 1 1 1

tellraw @a [{"text":"[全员逃走中] ","color":"gold"},{"text":"游戏开始!","color":"aqua"}]

function tzz_game:tzz_game_energy/tzz_game_energy

advancement grant @a only tzz_game:tzz_gamestart

function tzz_game_running:gamestart_minigame_1/load_gamestart_part