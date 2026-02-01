particle minecraft:poof -451.5 64.00 2017.5 2 2 5 0 1000
particle minecraft:wax_on -451.5 64.00 2017.5 2 2 5 0 500

execute if score green tzz_task_one_catcher_chest_lock matches 0 run \
setblock -450 63 2012 minecraft:iron_door[facing=west,powered=false,open=true]
execute if score yellow tzz_task_one_catcher_chest_lock matches 0 run \
setblock -450 63 2017 minecraft:iron_door[facing=west,powered=false,open=true]
execute if score purple tzz_task_one_catcher_chest_lock matches 0 run \
setblock -450 63 2022 minecraft:iron_door[facing=west,powered=false,open=true]