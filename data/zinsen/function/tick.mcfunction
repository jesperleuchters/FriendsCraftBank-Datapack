scoreboard players add @a SpielzeitInTicks 1

execute as @a if score @s SpielzeitInTicks matches 720000 if score @s Diamanten matches 500.. run scoreboard players add @s Diamanten 64
execute as @a if score @s SpielzeitInTicks matches 720000 if score @s Diamanten matches 250..499 run scoreboard players add @s Diamanten 32
execute as @a if score @s SpielzeitInTicks matches 720000 if score @s Diamanten matches 200..249 run scoreboard players add @s Diamanten 16
execute as @a if score @s SpielzeitInTicks matches 720000 if score @s Diamanten matches 150..199 run scoreboard players add @s Diamanten 8
execute as @a if score @s SpielzeitInTicks matches 720000 if score @s Diamanten matches 100..149 run scoreboard players add @s Diamanten 4
execute as @a if score @s SpielzeitInTicks matches 720000 if score @s Diamanten matches 50..99 run scoreboard players add @s Diamanten 2
execute as @a if score @s SpielzeitInTicks matches 720000 if score @s Diamanten matches 1..49 run scoreboard players add @s Diamanten 1

execute as @a if score @s SpielzeitInTicks matches 720002.. run scoreboard players set @s SpielzeitInTicks 2
