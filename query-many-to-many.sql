-- MANY TO MANY
-- see: Forta ch. 16
SELECT cake, who
FROM cakes, costumers, likes
WHERE costumers.costumers_id = likes.costumers_id
AND cakes.cakes_id = likes.cakes_id

-- ONE TO MANY
-- see Forta ch. 15
SELECT inventory .* , costumers.who
FROM inventory, costumers
WHERE inventory.costumers_id = costumers.costumers_id
