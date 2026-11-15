execute as @a if score @s Tode matches 1 run scoreboard players operation @s Diamanten += @s VersicherungErsterTod
execute as @a if score @s Tode matches 1 run scoreboard players operation @s VersicherungErsterTod *= 5 Zahlen
execute as @a if score @s Tode matches 1 run scoreboard players operation @s VersicherungErsterTod /= 100 Zahlen
execute as @a if score @s Tode matches 1 run scoreboard players operation @s Diamanten += @s VersicherungErsterTod
execute as @a if score @s Tode matches 1 run scoreboard players set @s VersicherungErsterTod 0
execute as @a if score @s Tode matches 1 run scoreboard players set @s Tode 2