execute as @a[tag=tzz_gender_male,tag=certification_male_passed] at @s \
 if entity @a[tag=tzz_gender_male,distance=..3] \
 run tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":"你已通过男生身份认证,不可重复认证!","color":"#61a2ff"}]

execute as @a[tag=tzz_gender_male,tag=!certification_male_passed] at @s \
 if entity @a[tag=tzz_gender_male,distance=..3] \
 run tag @s add certification_male_passed

execute as @a[tag=tzz_gender_male,tag=certification_male_passed] at @s \
 if entity @a[tag=tzz_gender_male,distance=..3] \
 run tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":"你已通过男生身份认证!","color":"#61a2ff"}]

execute as @a[tag=tzz_gender_female] at @s \
 if entity @a[tag=tzz_gender_female,distance=..3] \
 run tellraw @s [{text:"[全员逃走中]",color:"gold"},\
 {"text":" 你是女生身份,无法进行男生身份认证!","color":"#ff61f2"}]