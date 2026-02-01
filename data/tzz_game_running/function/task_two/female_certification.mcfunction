execute as @a[tag=tzz_gender_female,tag=certification_female_passed] at @s \
 if entity @a[tag=tzz_gender_female,distance=..3] \
 run tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":"你已通过女生身份认证,不可重复认证!","color":"#ff61f2"}]

execute as @a[tag=tzz_gender_female,tag=!certification_female_passed] at @s \
 if entity @a[tag=tzz_gender_female,distance=..3,] \
 run tag @s add certification_female_passed

execute as @a[tag=tzz_gender_female,tag=certification_female_passed] at @s \
 if entity @a[tag=tzz_gender_female,distance=..3] \
 run tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":"你已通过女生身份认证!","color":"#ff61f2"}]

execute as @a[tag=tzz_gender_male] at @s \
 if entity @a[tag=tzz_gender_male,distance=..3] \
 run tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":" 你是男生身份,无法进行女生身份认证!","color":"#61a2ff"}]