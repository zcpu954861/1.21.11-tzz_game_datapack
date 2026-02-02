# 出图检测（只在游戏进行中生效）
# 允许区域为多个矩形并集（由不规则多边形拆分）

# 冷却递减：避免出界提示/传送每tick触发
scoreboard players remove @a[scores={tzz_boundary_cd=1..}] tzz_boundary_cd 1

# 仅在游戏激活时检测
execute if score Global tzz_game_active matches 1.. as \
 @a[tag=!op] at @s unless entity @s[x=-566,dx=347,z=1968,dz=284] \
 unless entity @s[x=-566,dx=111,z=2252,dz=53] \
 unless entity @s[x=-455,dx=9,z=2252,dz=7] \
 run function tzz_game:tzz_boundary/outside
