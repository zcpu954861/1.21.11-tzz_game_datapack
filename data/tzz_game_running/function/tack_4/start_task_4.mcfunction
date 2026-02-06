tellraw @a [{"text":"["},\
 {"text":"复活任务","color":"dark_green"},\
 {"text":"]"},\
 {"text":"\n复活区域","color":"yellow"},\
 {"text":"出现"},\
 {"text":"四个复活装置","color":"gold"},\
 {"text":",首先需要在"},\
 {"text":"复活区域","color":"yellow"},\
 {"text":"找到"},\
 {"text":"红色潜影盒里的烟花","color":"aqua"},\
 {"text":",然后再找到区域内的"},\
 {"text":"复活装置","color":"gold"},\
 {"text":",把烟花放出去即可"},\
 {"text":"复活","color":"green"},\
 {"text":"复活任务不计算时间!"}]

scoreboard players set Global tzz_current_task 4
scoreboard players set Global tzz_revive_count 0
scoreboard players set Global tzz_op_timer_mode 1

setblock -749 67 2061 minecraft:redstone_block
setblock -749 67 2061 minecraft:diamond_block
setblock -802 67 2131 minecraft:redstone_block
setblock -802 67 2131 minecraft:diamond_block
setblock -738 64 2196 minecraft:redstone_block
setblock -738 64 2196 minecraft:diamond_block
setblock -792 106 2183 minecraft:redstone_block
setblock -792 106 2183 minecraft:diamond_block

tag @a[team=tzz_team_catcher,gamemode=adventure] add task_4_catcher_adventure
tag @a[team=tzz_team_catcher,gamemode=creative] add task_4_catcher_creative
gamemode spectator @a[tag=!death,team=tzz_team_runner]
gamemode spectator @a[team=tzz_team_catcher]
gamemode adventure @a[tag=death,team=tzz_team_runner]
tp @a -660.5 70.00 2097.5

# Clone source block (-579 66 2026) to multiple targets, 三个为一组
# 组 1
clone -579 66 2026 -579 66 2026 -587 69 2044 replace
clone -579 66 2026 -579 66 2026 -609 66 2040 replace
clone -579 66 2026 -579 66 2026 -640 64 2044 replace

# 组 2
clone -579 66 2026 -579 66 2026 -619 66 2059 replace
clone -579 66 2026 -579 66 2026 -607 66 2063 replace
clone -579 66 2026 -579 66 2026 -588 65 2066 replace

# 组 3
clone -579 66 2026 -579 66 2026 -569 65 2049 replace
clone -579 66 2026 -579 66 2026 -580 72 2108 replace
clone -579 66 2026 -579 66 2026 -596 71 2083 replace

# 组 4
clone -579 66 2026 -579 66 2026 -590 74 2132 replace
clone -579 66 2026 -579 66 2026 -617 72 2108 replace
clone -579 66 2026 -579 66 2026 -639 70 2094 replace

# 组 5
clone -579 66 2026 -579 66 2026 -665 70 2115 replace
clone -579 66 2026 -579 66 2026 -639 71 2143 replace
clone -579 66 2026 -579 66 2026 -671 70 2151 replace

# 组 6
clone -579 66 2026 -579 66 2026 -669 69 2189 replace
clone -579 66 2026 -579 66 2026 -653 71 2173 replace
clone -579 66 2026 -579 66 2026 -617 71 2183 replace

# 组 7
clone -579 66 2026 -579 66 2026 -598 72 2195 replace
clone -579 66 2026 -579 66 2026 -590 71 2170 replace
clone -579 66 2026 -579 66 2026 -571 71 2159 replace

# 组 8
clone -579 66 2026 -579 66 2026 -574 68 2185 replace
clone -579 66 2026 -579 66 2026 -717 69 2172 replace
clone -579 66 2026 -579 66 2026 -723 67 2132 replace

# 组 9
clone -579 66 2026 -579 66 2026 -705 67 2109 replace
clone -579 66 2026 -579 66 2026 -747 69 2080 replace
clone -579 66 2026 -579 66 2026 -767 68 2131 replace

# 组 10
clone -579 66 2026 -579 66 2026 -776 70 2146 replace
clone -579 66 2026 -579 66 2026 -796 68 2076 replace
clone -579 66 2026 -579 66 2026 -766 72 2048 replace

# 组 11
clone -579 66 2026 -579 66 2026 -702 66 2036 replace
clone -579 66 2026 -579 66 2026 -678 66 2057 replace
clone -579 66 2026 -579 66 2026 -653 73 2077 replace
