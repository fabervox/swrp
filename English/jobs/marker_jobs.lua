localPlayer = getLocalPlayer ()

function MarkerHit ( hitElement, matchingDimension )
	local swypenum = getElementData ( localPlayer, "swype" )
	destroyElement ( swype )
	givePlayerMoney ( 5 )
	if swypenum == 1 then
		swype = createMarker ( 2384.5439453125,2563.6748046875,10.482606887817, "checkpoint" )
	end
	if swypenum == 2 then
		swype = createMarker ( 2356.4609375,2515.279296875,10.428380012512, "checkpoint" )
	end
	if swypenum == 3 then
		swype = createMarker ( 2242.1025390625,2516.3017578125,10.419788360596, "checkpoint" )
	end
	if swypenum == 4 then
		swype = createMarker ( 2225.1279296875,2450.4287109375,10.574955940247, "checkpoint" )
	end
	if swypenum == 5 then
		swype = createMarker ( 2215.1279296875,2363.7841796875,10.418832778931, "checkpoint" )
	end
	if swypenum == 6 then
		swype = createMarker ( 2184.2197265625,2346.55078125,10.419318199158, "checkpoint" )
	end
	if swypenum == 7 then
		swype = createMarker ( 2092.837890625,2333.3466796875,10.419401168823, "checkpoint" )
	end
	if swypenum == 8 then
		swype = createMarker ( 2075.6650390625,2314.513671875,10.423260688782, "checkpoint" )
	end
	if swypenum == 9 then
		swype = createMarker ( 2030.1044921875,2388.2158203125,10.498854637146, "checkpoint" )
	end
	if swypenum == 10 then
		swype = createMarker ( 2029.8974609375,2492.9765625,10.420215606689, "checkpoint" )
	end
	if swypenum == 11 then
		swype = createMarker ( 2029.3818359375,2577.421875,13.244408607483, "checkpoint" )
	end
	if swypenum == 12 then
		swype = createMarker ( 2029.05859375,2635.236328125,10.447926521301, "checkpoint" )
	end
	if swypenum == 13 then
		swype = createMarker ( 2088.294921875,2651.28125,10.4189453125, "checkpoint" )
	end
	if swypenum == 14 then
		swype = createMarker ( 2089.654296875,2721.91015625,10.419405937195, "checkpoint" )
	end
	if swypenum == 15 then
		swype = createMarker ( 2109.3779296875,2770.4873046875,10.419497489929, "checkpoint" )
	end
	if swypenum == 16 then
		swype = createMarker ( 2165.5205078125,2770.3212890625,10.427172660828, "checkpoint" )
	end
	if swypenum == 17 then
		swype = createMarker ( 2224.794921875,2744.5087890625,10.419491767883, "checkpoint" )
	end
	if swypenum == 18 then
		swype = createMarker ( 2259.1396484375,2710.7958984375,10.419404983521, "checkpoint" )
	end
	if swypenum == 19 then
		swype = createMarker ( 2344.7802734375,2739.556640625,10.567281723022, "checkpoint" )
	end
	setElementData ( localPlayer, "swype", swypenum + 1 )
	addEventHandler( "onClientMarkerHit", swype, MarkerHit )
	if swypenum == 20 then
		local theVehicle = getPedOccupiedVehicle ( localPlayer )
		setControlState ( "enter_exit", true )
		outputChatBox("Информация: Вы успешно почистили улицы нашего города! Премия: 200$", 0,153,51)
		removeEventHandler( "onClientMarkerHit", swype, MarkerHit )
  		local xpos = getElementData ( theVehicle, "xpos" )
  		local ypos = getElementData ( theVehicle, "ypos" )
  		local zpos = getElementData ( theVehicle, "zpos" )
  		setElementPosition ( theVehicle, xpos, ypos, zpos )
  		setElementRotation ( theVehicle, getElementData ( theVehicle, "angle" ))
  		exports.busineses:giveToBizMoney ( 10, 500, 50)
  		givePlayerMoney ( 200 )
	end
end 

function startSwype ( commandName )
	if tonumber(getElementData ( localPlayer, "work" )) == 3 then
	    if isPedInVehicle ( localPlayer ) then
			if getElementModel ( getPedOccupiedVehicle ( localPlayer ) ) == 574 then
				swype = createMarker ( 2369.5947265625,2709.787109375,10.419460296631, "checkpoint" )
				addEventHandler( "onClientMarkerHit", swype, MarkerHit )
				setElementData ( localPlayer, "swype", 1 )
				outputChatBox ("Подсказка: Отправляйтесь по отметкам чистить улицы", source, 255,255,255 )
			else
				outputChatBox("Ошибка: В этой машине нельзя чистить улицы", 102, 0, 0)
			end
		else
		    outputChatBox("Ошибка: Вы не в машине", 102, 0, 0)
		end
	else
		outputChatBox("Ошибка: Вы не работаете чистильщиком улиц", 102, 0, 0)
	end
end
addCommandHandler ( "swype", startSwype )

function startBusDrive ( commandName )
	if tonumber(getElementData ( localPlayer, "work" )) == 4 then
	    if isPedInVehicle ( localPlayer ) then
			if getElementModel ( getPedOccupiedVehicle ( localPlayer ) ) == 437 then
				station = createMarker ( 1562.3583984375,2345.8359375,10.490339279175, "checkpoint" )
				addEventHandler( "onClientMarkerHit", station, stationMarkerHit )
				setElementData ( localPlayer, "station", 1 )
				outputChatBox ("Подсказка: Отправляйтесь по маршруту 1", source, 255,255,255 )
			else
				outputChatBox("Ошибка: Вы должны быть в автобусе", 102, 0, 0)
			end
		else
		    outputChatBox("Ошибка: Вы не в машине", 102, 0, 0)
		end
	else
		outputChatBox("Ошибка: Вы не работаете водителем автобуса", 102, 0, 0)
	end
end
addCommandHandler ( "startbus", startBusDrive )

function stationMarkerHit ( hitElement, matchingDimension )
	local stationnum = getElementData ( localPlayer, "station" )
	destroyElement ( station )
	givePlayerMoney ( 10 )
	local bus = getPedOccupiedVehicle ( localPlayer )
	setVehicleDoorState ( bus, 0, 0 )
	toggleAllControls ( false, true, false )
	if stationnum == 1 then
		outputChatBox ( "Остановка доки",255,153,204 )
	end
	if stationnum == 2 then
		outputChatBox ( "Остановка 1",255,153,204 )
	end
	if stationnum == 3 then
		outputChatBox ( "Остановка 2",255,153,204 )
	end
	if stationnum == 4 then
		outputChatBox ( "Остановка 3",255,153,204 )
	end
	if stationnum == 5 then
		outputChatBox ( "Остановка доки",255,153,204 )
	end
	if stationnum == 6 then
		outputChatBox ( "Остановка доки",255,153,204 )
	end
	if stationnum == 7 then
		outputChatBox ( "Остановка доки",255,153,204 )
	end
	if stationnum == 8 then
		outputChatBox ( "Остановка доки",255,153,204 )
	end
	if stationnum == 9 then
		outputChatBox ( "Остановка Мост",255,153,204 )
	end
	if stationnum == 10 then
		outputChatBox ( "Остановка Казино Рояль",255,153,204 )
	end
	if stationnum == 11 then
		outputChatBox ( "Остановка Клоун",255,153,204 )
	end
	if stationnum == 12 then
		outputChatBox ( "Остановка Казино Центральное",255,153,204 )
	end
	if stationnum == 13 then
		outputChatBox ( "Остановка Остров Эдельвейса",255,153,204 )
	end
	if stationnum == 14 then
		outputChatBox ( "Остановка доки",255,153,204 )
	end
	if stationnum == 15 then
		outputChatBox ( "Остановка Торговый ряд",255,153,204 )
	end
	if stationnum == 16 then
		outputChatBox ( "Остановка задворки",255,153,204 )
	end
	if stationnum == 17 then
		outputChatBox ( "Остановка доки 2",255,153,204 )
	end
	if stationnum == 18 then
		outputChatBox ( "Остановка Конечная",255,153,204 )
		outputChatBox ("Подсказка: Вы закончили маршрут, тепеь ведите автобус на парковку", source, 255,255,255 )
	end
	outputChatBox("Информация: Теперь ждите 4 секунды", 0,153,51)
	setTimer ( atBusStation, 4000, 1, bus )
end

function atBusStation ( bus )
	local stationnum = getElementData ( localPlayer, "station" )
	if stationnum == 1 then
		station = createMarker ( 1562.1103515625,2200.859375,10.490375518799, "checkpoint" )
	end
	if stationnum == 2 then
		station = createMarker ( 1501.466796875,2058.5263671875,10.495129585266, "checkpoint" )
	end
	if stationnum == 3 then
		station = createMarker ( 1335.564453125,2058.001953125,10.490956306458, "checkpoint" )
	end
	if stationnum == 4 then
		station = createMarker ( 1382.3671875,1919.92578125,10.491139411926, "checkpoint" )
	end
	if stationnum == 5 then
		station = createMarker ( 1605.1259765625,1868.1748046875,10.490695953369, "checkpoint" )
	end
	if stationnum == 6 then
		station = createMarker ( 1642.32421875,1746.2744140625,10.490523338318, "checkpoint" )
	end
	if stationnum == 7 then
		station = createMarker ( 1686.8779296875,1707.8828125,10.490686416626, "checkpoint" )
	end
	if stationnum == 8 then
		station = createMarker ( 1726.5283203125,1529.5732421875,10.486681938171, "checkpoint" )
	end
	if stationnum == 9 then
		station = createMarker ( 1896.703125,1448.2265625,10.490520477295, "checkpoint" )
	end
	if stationnum == 10 then
		station = createMarker ( 2075.2568359375,1478.8466796875,10.419404983521, "checkpoint" )
	end
	if stationnum == 11 then
		station = createMarker ( 2121.3017578125,1795.5537109375,10.419406890869, "checkpoint" )
	end
	if stationnum == 12 then
		station = createMarker ( 2154.7353515625,2174.2265625,10.419406890869, "checkpoint" )
	end
	if stationnum == 13 then
		station = createMarker ( 2128.0908203125,2355.60546875,10.419388771057, "checkpoint" )
	end
	if stationnum == 14 then
		station = createMarker ( 2089.654296875,2721.91015625,10.419405937195, "checkpoint" )
	end
	if stationnum == 15 then
		station = createMarker ( 2050.140625,2288.1953125,10.491172790527, "checkpoint" )
	end
	if stationnum == 16 then
		station = createMarker ( 1867.2919921875,2277.947265625,10.490953445435, "checkpoint" )
	end
	if stationnum == 17 then
		station = createMarker ( 1676.13671875,2278.376953125,10.490881919861, "checkpoint" )
	end
	if stationnum == 18 then
		station = createMarker ( 1572.4482421875,2291.353515625,10.49098777771, "checkpoint" )
		outputChatBox ( "Остановка Конечная",255,153,204 )
		outputChatBox ("Подсказка: Вы закончили маршрут, тепеь ведите автобус на парковку", source, 255,255,255 )
	end
	if stationnum == 19 then
		local theVehicle = getPedOccupiedVehicle ( localPlayer )
		setControlState ( "enter_exit", true )
		outputChatBox("Информация: Вы успешно проехали по маршруту! Премия: 500$", 0,153,51)
		removeEventHandler( "onClientMarkerHit", station, stationMarkerHit )
  		local xpos = getElementData ( theVehicle, "xpos" )
  		local ypos = getElementData ( theVehicle, "ypos" )
  		local zpos = getElementData ( theVehicle, "zpos" )
  		setElementPosition ( theVehicle, xpos, ypos, zpos )
  		setElementRotation ( theVehicle, getElementData ( theVehicle, "angle" ))
  		givePlayerMoney ( 500 )
  		exports.busineses:giveToBizMoney ( 9, 1000, 100)
	end
	toggleAllControls ( true )
	addEventHandler( "onClientMarkerHit", station, stationMarkerHit )
	setElementData ( localPlayer, "station", stationnum + 1 )
end