execute as @a if score @s digipay matches 1.. run scoreboard players set @s isInPayment 1
execute as @a if score @s isInPayment matches 1 run scoreboard players reset @a digipay
execute unless entity @a[scores={isInPayment=1..}] run scoreboard players enable @a digipay

execute as @a if score @s isInPayment matches 1 store result score transactionCode digipay run random value 1000..9999
execute as @a if score @s isInPayment matches 1 run tellraw @s ["",{"text":"Der Transaktionscode lautet: "},{"score":{"name":"transactionCode","objective":"digipay"},"color":"#991111"}]

execute as @a if score @s isInPayment matches 1 run tellraw @s ["",{"text":"Lege einen Preis fest, indem du"},{"text":"\n/trigger setPrice set [Preis]","color":"#119999"},{"text":"\neingibst.","color":"white"}]

execute as @a if score @s isInPayment matches 1.. run scoreboard players add timer digipay 1
execute if score timer digipay matches 3600.. run scoreboard players set cache_b01 Diamanten 0
execute if score timer digipay matches 3600.. run scoreboard players set @a isInPayment 0
execute if score timer digipay matches 3600.. run scoreboard players reset @a setPrice
execute if score timer digipay matches 3600.. run scoreboard players set ok bezahlen 0
execute if score timer digipay matches 3600.. run scoreboard players reset @a bezahlen
execute if score timer digipay matches 3601.. run scoreboard players set timer digipay 0

execute as @a if score @s isInPayment matches 1 run scoreboard players set @s isInPayment 2
execute as @a if score @s isInPayment matches 2 run scoreboard players enable @s setPrice
execute as @a if score @s isInPayment matches 2 if score @s setPrice matches 1.. run scoreboard players set @s isInPayment 3

execute as @a if score @s isInPayment matches 3 run tellraw @s ["",{"text":"Preis auf "},{"score":{"name":"@s","objective":"setPrice"},"color":"#119999"},{"text":"D","color":"#119999"},{"text":" festgelegt.","color":"white"}]
execute as @a if score @s isInPayment matches 3 run scoreboard players enable @a bezahlen
execute as @a if score @s isInPayment matches 3 run scoreboard players set @s isInPayment 4

execute as @a if score @s isInPayment matches 4 run scoreboard players operation cache_b01 Diamanten = @s setPrice
execute as @a if score @s bezahlen matches 1 run tellraw @s [{"text":"Bestätige deine Zahlung über "},{"score":{"name":"cache_b01","objective":"Diamanten"},"color":"#991111"},{"text":"D","color":"#991111"},{"text":", indem du","color":"white"},{"text":"\n/trigger bezahlen set [Code]","color":"#119999"},{"text":"\neingibst.","color":"white"}]
execute as @a if score @s bezahlen matches 1 run scoreboard players enable @a bezahlen
execute as @a if score @s bezahlen matches 1 run scoreboard players set @s bezahlen 0

execute as @a if score @s bezahlen = transactionCode digipay run execute if score @s Diamanten < cache_b01 Diamanten run scoreboard players set ok bezahlen -1
execute as @a if score @s bezahlen = transactionCode digipay run execute if score @s Diamanten >= cache_b01 Diamanten run scoreboard players set ok bezahlen 1
execute if score ok bezahlen matches 1 as @a if score @s bezahlen = transactionCode digipay run scoreboard players operation @s Diamanten -= cache_b01 Diamanten
execute if score ok bezahlen matches 1 run scoreboard players operation @a[scores={isInPayment=4}] Diamanten += cache_b01 Diamanten

execute if score ok bezahlen matches 1 as @a if score @s bezahlen = transactionCode digipay run tellraw @s [{"text":"Erfolg!","color":"#119911"},{"text":"\nDeine Zahlung über ","color":"white"},{"score":{"name":"cache_b01","objective":"Diamanten"},"color":"#991111"},{"text":"D","color":"#991111"},{"text":" wurde ausgeführt.","color":"white"}]
execute if score ok bezahlen matches 1 as @a if score @s bezahlen = transactionCode digipay run tellraw @a[scores={isInPayment=1..}] [{"text":"Erfolg!","color":"#119911"},{"text":"\nDie Zahlung über ","color":"white"},{"score":{"name":"cache_b01","objective":"Diamanten"},"color":"#991111"},{"text":"D","color":"#991111"},{"text":" wurde ausgeführt.","color":"white"}]
execute if score ok bezahlen matches -1 as @a if score @s bezahlen = transactionCode digipay run tellraw @s [{"text":"Abgelehnt!","color":"#991111"},{"text":"\nDeine Zahlung über ","color":"white"},{"score":{"name":"cache_b01","objective":"Diamanten"},"color":"#991111"},{"text":"D","color":"#991111"},{"text":" konnte nicht ausgeführt werden. Die Zahlung wird abgebrochen.","color":"white"}]
execute if score ok bezahlen matches -1 as @a if score @s bezahlen = transactionCode digipay run tellraw @a[scores={isInPayment=1..}] [{"text":"Abgelehnt!","color":"#991111"},{"text":"\nDie Zahlung über ","color":"white"},{"score":{"name":"cache_b01","objective":"Diamanten"},"color":"#991111"},{"text":"D","color":"#991111"},{"text":" konnte nicht ausgeführt werden. Die Zahlung wird abgebrochen.","color":"white"}]

execute if score ok bezahlen matches -1 run scoreboard players set timer digipay 3599
execute as @a if score @s bezahlen = transactionCode digipay run scoreboard players set cache_b01 Diamanten 0
execute as @a if score @s bezahlen = transactionCode digipay run scoreboard players set @a isInPayment 0
execute as @a if score @s bezahlen = transactionCode digipay run scoreboard players reset @a setPrice
execute as @a if score @s bezahlen = transactionCode digipay run scoreboard players set ok bezahlen 0
execute as @a if score @s bezahlen = transactionCode digipay run scoreboard players set timer digipay 0
execute as @a if score @s bezahlen = transactionCode digipay run scoreboard players reset @a bezahlen
