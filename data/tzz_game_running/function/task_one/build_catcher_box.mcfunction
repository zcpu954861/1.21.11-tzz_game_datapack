particle minecraft:poof -451.5 64.00 2017.5 2 2 5 0 1000
particle minecraft:wax_on -451.5 64.00 2017.5 2 2 5 0 500
setblock -448 47 2008 minecraft:redstone_block
setblock -448 47 2008 minecraft:diamond_block
tp @a[scores={tzz_catcher_spawn_selected=4}] -450.5 63 2022.5
tp @a[scores={tzz_catcher_spawn_selected=5}] -450.5 63 2017.5
tp @a[scores={tzz_catcher_spawn_selected=6}] -450.5 63 2012.5
tp @a[scores={tzz_catcher_spawn_selected=7}] -375.5 79.00 2143.5
tp @a[scores={tzz_catcher_spawn_selected=8}] -375.5 79.00 2143.5
tp @a[scores={tzz_catcher_spawn_selected=9}] -375.5 79.00 2143.5
loot give @a[scores={tzz_catcher_spawn_selected=7}] loot tzz_item:green_card
loot give @a[scores={tzz_catcher_spawn_selected=8}] loot tzz_item:yellow_card
loot give @a[scores={tzz_catcher_spawn_selected=9}] loot tzz_item:purple_card
gamemode adventure @a[scores={tzz_catcher_spawn_selected=4}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=5}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=6}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=7}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=8}]
gamemode adventure @a[scores={tzz_catcher_spawn_selected=9}]