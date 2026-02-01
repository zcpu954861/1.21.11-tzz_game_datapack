#用于开始猎人箱的刷新动画
particle minecraft:poof -375.44 80.00 2185.44 3 2 2 0 1000
particle minecraft:wax_on -375.44 80.00 2185.44 3 2 2 0 500

setblock -379 67 2182 redstone_block
setblock -379 67 2182 diamond_block

gamemode adventure @a[scores={tzz_catcher_spawn_selected=1}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=2}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=3}]

tp @a[scores={tzz_catcher_spawn_selected=1}] -377.5 77.00 2185.5
tp @a[scores={tzz_catcher_spawn_selected=2}] -375.5 77.00 2185.5
tp @a[scores={tzz_catcher_spawn_selected=3}] -373.5 77.00 2185.5

schedule function tzz_game_running:gamestart_catcherbox_spawn/catcherbox_spawn_2 30t