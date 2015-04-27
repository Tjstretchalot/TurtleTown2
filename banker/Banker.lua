banker = {}
MAX = 16
banker.chestCorner = function()
	inventory.select(chest)
	turtle.placeDown()
	move.forward()
	turtle.placeDown()
	move.forward()
	inventory.select(cobblestone)
	turtle.placeDown()
	inventory.select(chest)
	move.turnRight()
	move.forward()
	turtle.placeDown()
	move.forward()
	turtle.placeDown()
	move.forward()
	move.forward()
end
banker.cobbleCorner = function()
	inventory.select(cobblestone)
	turtle.placeDown()
	move.forward()
	turtle.placeDown()
	move.forward()
	move.turnRight()
	move.forward()
	turtle.placeDown()
	move.forward()
	move.turnLeft()
	move.forward()
	turtle.placeDown()
	move.turnRight()
	move.forward()
	turtle.placeDown()
	move.forward()
	move.forward()
	
end
banker.build = function(layer)
	move.north(3)
	inventory.select(chest)
	turtle.place()
	for i = 1, layer, 1 do
		turtle.up()
	end
	move.turnRight()
	move.forward()
	for i = 1, 4, 1 do
		chestCorner()
	end
	move.turnLeft()
	move.forward()
	move.turnRight()
	for i = 1, 4, 1 do
		cobbleCorner()
	end
	move.turnRight()
	move.south(4)
	move.turnRight()
	move.forward()
	for i = 1, layer, 1 do
		turtle.down()
	end
	
end
banker.save = function()
	local w = fs.open('banker_cache', 'w')
	
	w.writeLine(tostring(layers))
	
	w.close()
end
banker.load = function()
	layers = 0
	if fs.exists('banker_cache') then
		local r = fs.open('banker_cache', 'r')
		
		layer = tonumber(r.readLine())
		
		r.close()
	end
end
banker.addLayer = function()
	if layers != MAX then
		banker.load()
		layers = layers + 1
		banker.build(layers)
		banker.save()
	else
		--create new turtle segment
	end
end
banker.storage = function()
	
end