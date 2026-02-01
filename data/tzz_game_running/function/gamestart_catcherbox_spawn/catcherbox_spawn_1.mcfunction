#用于开始猎人箱的刷新动画
function tzz_game:tzz_config/gamestart/catcher_fx
function tzz_game:tzz_config/gamestart/catcherbox_spawn_1_blocks

gamemode adventure @a[scores={tzz_catcher_spawn_selected=1}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=2}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=3}]

function tzz_game:tzz_config/gamestart/catcherbox_spawn_1_tps

schedule function tzz_game_running:gamestart_catcherbox_spawn/catcherbox_spawn_2 30t