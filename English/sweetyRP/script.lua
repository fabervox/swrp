﻿function loadServProp ()
	local xmlFile = xmlLoadFile ( "ServerProp.xml" ) -- Open a file that we have already created
	if xmlFile then -- If it's indeed opened
		local node = xmlFindChild ( xmlFile, "sname", 0 )
		success = xmlNodeGetValue ( node )
		local serveradmin = xmlFindChild ( xmlFile, "admin", 0 )
		serveradmin1 = xmlNodeGetValue ( serveradmin )                              
		local scripter = xmlFindChild (xmlFile, "scripter", 0 )
		scripter1 = xmlNodeGetValue ( scripter )
		local site = xmlFindChild (xmlFile, "site", 0 )
		site1 = xmlNodeGetValue ( site )
		local verison = xmlFindChild (xmlFile, "verison", 0 )
		verison1 = xmlNodeGetValue ( verison )
		local tax1 = xmlFindChild (xmlFile, "tax", 0 )                                                                           
		tax = xmlNodeGetValue ( tax1 )
		local time = getRealTime()
		local hours = time.hour
		local minutes = time.minute
		--setTime ( 0, 0 )
		local weather = math.random(0,19)
		setWeather ( weather )
		setMinuteDuration(60000)
		local equippickup = createPickup ( 221.5,185.1396,1003.0312, 3, 1239, 3000 )
		local dutypickup = createPickup ( 243.8281,190.0732,1008.1718, 3, 1239, 3000 )
		local arrestpickup = createPickup ( 201.2636,168.3466,1003.0234, 3, 1314, 3000 )
		createPickup ( 2295.7031,2452.0253,10.8203, 3, 1314, 3000 )
		local armourpickup = createPickup ( 221.3281,188.0654,1003.0312, 1, 100 )
		local healthpickup = createPickup ( 222.0009,186.5429,1003.0312, 0, 100 )
		local mayorarmourpickup = createPickup ( 351.453125,216.3388671875,1008.3828125, 3, 1242 )
		createPickup ( 1713.748046875,1303.3134765625,10.827939987183, 3, 1239 ) -- работа таксистом
		createPickup ( 2399.462890625,1482.697265625,10.8203125, 3, 1239 ) -- работа механиком
		createPickup ( 2371.98046875,2760.1083984375,10.8203125, 3, 1239 ) -- работа свипером
		createPickup ( 1643.3720703125,2335.9345703125,10.8203125, 3, 1239 ) -- работа водителем автобуса
		createPickup ( 2814.703125,973.3115234375,10.75, 3, 1239 ) -- работа дальнобойщиком
		createBlip ( 2399.462890625,1482.697265625,10.8203125, 58, 2, 255, 0, 0, 255, 0, 330 ) -- работа механиком
		createBlip ( 1713.748046875,1303.3134765625,10.827939987183, 59, 2, 255, 0, 0, 255, 0, 330 ) -- работа таксистом
		createBlip ( 2371.98046875,2760.1083984375,10.8203125, 60, 2, 255, 0, 0, 255, 0, 330 ) -- работа свипером
		createBlip ( 1643.3720703125,2335.9345703125,10.8203125, 61, 2, 255, 0, 0, 255, 0, 330 ) -- работа водителем автобуса
		createBlip ( 1607.203125,1815.240234375,10.8203125, 22, 2, 255, 0, 0, 255, 0, 330 ) -- больница
		createBlip ( 1736.5888671875,1898.990234375,11.139877319336, 55, 2, 255, 0, 0, 255, 0, 330 ) -- аренда машин
		createBlip ( 2133.2607421875,1403.697265625,11.1328125, 55, 2, 255, 0, 0, 255, 0, 330 ) -- авторынок
		createBlip ( 1168.689453125,1353.2724609375,10.921875, 36, 2, 255, 0, 0, 255, 0, 330 ) -- автошкола
		createBlip ( 2814.703125,973.3115234375,10.75, 51, 2, 255, 0, 0, 255, 0, 330 ) -- дальнобойщики
		--createBlip ( 2133.2607421875,1403.697265625,11.1328125, 55, 2, 255, 0, 0, 255, 0, 330 ) -- авторынок
		local ammopickup = createPickup ( 288.0966796875,-109.7119140625,1001.515625, 3, 1274 )
		local buypickup = createPickup ( 2.3837,-29.0126,1003.5494, 3, 1274 )
		setTimer ( SeeThePlayers, 1000, 0 )
		setElementInterior ( dutypickup, 3 )
		setElementInterior ( equippickup, 3 )
		setElementInterior ( arrestpickup, 3 )
		setElementInterior ( armourpickup, 3 )
		setElementInterior ( mayorarmourpickup, 3 )
		setElementInterior ( healthpickup, 3 )
		setElementInterior ( ammopickup, 6 )
		setElementInterior ( buypickup, 10 )
		copbarrier = createObject ( 968, 2238.2, 2450.4064, 10.6131, 0, 90, 90 )
		outputServerLog( "  #####         ######  ######       #        #####  " )
		outputServerLog( " #     # #    # #     # #     #     ##       #     # " )
		outputServerLog( " #       #    # #     # #     #    # #             # " )
		outputServerLog( "  #####  #    # ######  ######       #        #####  " )
		outputServerLog( "       # # ## # #   #   #            #   ###       # " )
		outputServerLog( " #     # ##  ## #    #  #            #   ### #     # " )
		outputServerLog( "  #####  #    # #     # #          ##### ###  #####  " )

		maxhouses = 0
	end
end

addEventHandler ( "onResourceStart", getResourceRootElement(), loadServProp )

function setCameraOnPlayerJoin()
  	  fadeCamera(source, true, 5)
	  setCameraMatrix(source, 2123.3186,2225.5566,10.6719, 2152.5303,2045.3932,17.1303)
end
addEventHandler("onPlayerJoin", getRootElement(), setCameraOnPlayerJoin)

function onPlayerJoin ( )
	outputChatBox("Welcome to " .. tostring ( success ) .. " server", source, 51,51,255)
	outputChatBox("Game admin: " .. tostring ( serveradmin1 ) .. " ", source, 153,102,255)
	outputChatBox("Scripter: " .. tostring ( scripter1 ) .. " ", source, 204,153,255)
	outputChatBox("Site: " .. tostring ( site1 ) .. " ", source, 204,153,204)
	outputChatBox("Mode version: " .. tostring ( version1 ) .. " ", source, 153,204,204)
end

addEventHandler ( "onPlayerJoin", getRootElement ( ), onPlayerJoin )

function savePos(thePlayer,command,comment)
    local x, y, z = getElementPosition(thePlayer)
    local xr,yr,zr = getElementRotation ( thePlayer )
    hFile = fileOpen("pos.txt", false)
    if hFile then
        local temp
        while not fileIsEOF(hFile) do
        temp = fileRead(hFile, 500)
    end
        fileWrite(hFile,x .. ',' .. y .. ',' .. z .. ',' .. xr .. ',' .. yr .. ',' .. zr .. ',' .. comment .. '\n')
    else
        hFile = fileCreate("pos.txt")
        fileWrite(hFile,x .. ',' .. y .. ',' .. z .. ',' .. xr .. ',' .. yr .. ',' .. zr .. ',' .. comment .. '\n')
    end
    outputChatBox("Saved!", thePlayer)
    fileClose(hFile)
end
addCommandHandler ("pos", savePos)

function SeeThePlayers( )
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	if (minutes == 15 and seconds == 0) or (minutes == 45 and seconds == 0) or (minutes == 30 and seconds == 0) or (minutes == 55 and seconds == 0) or (minutes == 5 and seconds == 0) then
		exports.factions:saveFactions ()
		exports.cars:saveCars ()
		exports.houses:saveHouses ()
		exports.busineses:saveBusineses ()
		exports.players:savePlayersAccounts ()
	end
	if minutes == 0 and seconds == 0 then
		if hours == 12 then
			local vehicles = getElementsByType ( "vehicle" ) -- get a table of all the players in the server
			for theKey,theCar in ipairs(vehicles) do -- use a generic for loop to step through each player
			   if tonumber(getElementData ( theCar, "type" )) == 7 then
			        setElementData ( theCar, "owner", 0 )
			    end
			end
		end
		local seconds = time.second
		if seconds == 0 then
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				outputChatBox ( "Payday time!", player, 204,102,0 )
				outputChatBox ( "--------------------------------------", player, 255,102,0)
				local payday = 1000
				outputChatBox ( "Main: 1000$", player, 153,102,51 )
				if tonumber(getElementData ( player, "faction" )) ~= 0 then
					payday = payday + 500
					outputChatBox ( "Faction: 500$", player, 153,102,51 )
					if tonumber(getElementData ( player, "rank" )) > 3 then
						outputChatBox ( "Rank: 1000$", player, 153,102,51 )
						payday = payday + 1000
					end
				end
				if tonumber(getElementData ( player, "work" )) > 0 then
				--	payday = payday
					outputChatBox ( "Work: 250$", player, 153,102,51 )
					payday = payday + 250
				end
				outputChatBox ( "Total: "..tostring(payday).."$", player, 153,102,51 )
				outputChatBox ( "-------------------------------------", player, 255,102,0)
				givePlayerMoney ( player, payday )
				if tonumber(getElementData ( player, "house" )) > 0 then
	            	outputChatBox ( "House tax: "..tostring(tax).."$ ", player, 204,102,51)
	            	outputChatBox ( "--------------------------------------", player, 255,102,0)
	            	takePlayerMoney ( player, tonumber(tax) )
					exports.factions:giveFactionMoney( 3, tonumber(tax) )
	            end
	            if getElementData ( player, "rentcar" ) > 0 and hours == 12 then
               		outputChatBox ("Information: Car rent ended",player, 0,153,51 )
					setElementData ( player, "rentcar", 0 )
				end
				if getElementData ( player, "renthouse" ) > 0 then
               		outputChatBox ("House rent price: "..tostring(getElementData ( exports.houses:getHouse(houserent), "rentprice" )).."$",player, 0,153,51 )
					takerPlayerMoney ( player, getElementData ( exports.houses:getHouse(houserent), "rentprice" ) )
					exports.houses:giveHouseMoney ( getElementData ( player, "houserent" ), getElementData ( exports.houses:getHouse(houserent), "rentprice" ) )
				end
	        	outputChatBox ( "Good luck!", player, 204,102,0 )
			end
			local weather = math.random(0,20)
			setWeather ( weather )
		end
	end
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if(tonumber(getElementData(player, "online")) == 1) then
			if(tonumber(getElementData ( player, "arrest" )) > 0) then
				if(tonumber(getElementData ( player, "arrest" )) > 999) then
					setElementData(player, "arrest", tonumber(getElementData ( player, "arrest" )) - 1000)
				else
					setElementData(player, "arrest", 0)
				end
				if(tonumber(getElementData ( player, "arrest" )) == 0) then
					outputChatBox ( "You leaved prison", player )
					setElementPosition(player, 2286.3144,2431.4667,10.8203)
					setElementInterior( player, 0) 
				end	
			end
		end
	end
end

-----------------------------

function playerToPoint( player, radius, x, y, z )
    if isElement( player ) and radius and x and y and z then
        return getDistanceBetweenPoints3D( x, y, z, getElementPosition( player ) ) <= radius
    end
    return false
end

function pickupUse ( source )
	if(playerToPoint(source,1,351.453125,216.3388671875,1008.382812)) then
     	if ( exports.factions:getFactionInfo(getElementData ( source, "faction" ), 17) == 4 ) then
   			setPedArmor ( source, 100 )
		end
	end
end
addEventHandler ( "onPickupUse", getRootElement(), pickupUse )

function sendClientActionMessage ( source, nomer )
    local x,y,z = getElementPosition( source )
	nomer = tonumber(nomer)
	if(nomer == 1) then
		sendActionMessage( source, x, y, z, 4, "started vehicle engine" )
	end
	if(nomer == 2) then
	    sendActionMessage( source, x, y, z, 4, "stopped vehicle engine" )
	end
	if nomer == 3 then
	    sendActionMessage( source, x, y, z, 4, "ate small rat" )
	end
	if nomer == 4 then
	    sendActionMessage( source, x, y, z, 4, "выпивает бутылку воды" )
	end
	if nomer == 5 then
	    sendActionMessage( source, x, y, z, 4, "поедает зажернную во фритюре руку зомби" )
	end
	if nomer == 6 then
	    sendActionMessage( source, x, y, z, 4, "вкалывает себе лекартсво" )
	end
	if nomer == 7 then
	    sendActionMessage( source, x, y, z, 4, "хрусит крыской" )
	end
	if nomer == 8 then
	    sendActionMessage( source, x, y, z, 4, "хрусит гигантской крысой" )
	end
	if nomer == 9 then
	    sendActionMessage( source, x, y, z, 4, "хрустит, поедая свежеиспеченную птицу-зомби" )
	end
	if nomer == 10 then
	    sendActionMessage( source, x, y, z, 4, "поедает зараженный радиацией огурец" )
	end
	if nomer == 11 then
	    sendActionMessage( source, x, y, z, 4, "give her weapon" )
	end
end

function showPassport ( source, commandName, ident )
	local x, y, z = getElementPosition ( source )
	local sex = tonumber(getElementData ( source, "sex" ))
	local national = tonumber(getElementData ( source, "nationality" ))
	local job = tonumber(getElementData ( source, "work" ))
	local crimes = tonumber(getElementData ( source, "crimes" ))
	local name = getPlayerName ( source )
	local playeronline = 0
	if ident then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( getElementData ( player, "playerid" ) ==  tonumber(ident) ) then
                triggerClientEvent ( player, "showPlayerPassporte", player, name, sex, job, national, crimes)
                sendActionMessage( source, x, y, z, 6, "show " .. getPlayerName(player) .. " his passport" )
			end
		end
		if (playeronline == 0) then
			outputChatBox ("This player is offline",source, 255,255,127 )
		end
	else
		sendActionMessage( source, x, y, z, 6, "look ate his passport" )
  		triggerClientEvent ( source, "showPlayerPassporte", source, name, sex, job, national, crimes)
	end
end

addCommandHandler ("passport", showPassport )

function showLicenses( source, commandName, ident )
	local x, y, z = getElementPosition ( source )
	local fly = tonumber(getElementData ( source, "fly" ))
	local boat = tonumber(getElementData ( source, "boat" ))
	local weapon = tonumber(getElementData ( source, "weapons" ))
	local drive = tonumber(getElementData ( source, "drive" ))
	local name = getPlayerName ( source )
	local playeronline = 0
	if ident then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( getElementData ( player, "playerid" ) ==  tonumber(ident) ) then
                triggerClientEvent ( player, "showPlayerLic", player, drive, fly, boat, weapon, name)
                sendActionMessage( source, x, y, z, 6, "показал " .. getPlayerName(player) .. " свои лицензии" )
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
		sendActionMessage( source, x, y, z, 6, "смотрит свои лицензии" )
  		triggerClientEvent ( source, "showPlayerLic", source, drive, fly, boat, weapon, name)
	end
end

addCommandHandler ("licenses", showLicenses )




--function completeUstnTestPDD ( car )
--	warpPedIntoVehicle ( source, car )
--	setVehicleLocked ( car, true )
--end
--
--addEvent("completeTestPDD",true)
--addEventHandler("completeTestPDD",root,completeUstnTestPDD)

function SetHelperPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				setElementData ( player, "admin", "1")
			    playeronline = 1
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
    	outputChatBox ("Правильно: /sethelper ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("sethelper", SetHelperPlayer)

function AskQuestionChat( source, cmd, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
		local x,y,z = getElementPosition( source )
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if tonumber(getElementData ( player, "admin" ) > 0 ) then
                outputChatBox ("Игрок с ид "..getElementData(source, "playerid").." задал вопрос: "..text.." ", player, 255,255,255)
                outputChatBox ("Подсказка: ответить на его вопрос: /answer "..getElementData(source, "playerid").." ответ", player, 255,204,255 )
                outputChatBox ("Информация: Вы задали вопрос хелперам, если они в сети, то сейчас вам ответят",source, 0,153,51 )
			end
		end
	else
	  	outputChatBox ("Правильно: /que вопрос ", 255,255,255)
	end
end

addCommandHandler ("que", AskQuestionChat)

function AnsQuestionChat( source, cmd, ident, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
	    if ident then
			local x,y,z = getElementPosition( source )
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
                outputChatBox ("Хелпер "..getPlayerName ( source ).." отвечает: "..text.." ", 255,255,255)
                outputChatBox ("Подсказка: ответить на его вопрос: /answer "..getElementData(source, "playerid").." ответ", source, 255,204,255 )
                outputChatBox ("Информация: Вы ответили на вопрос игрока",source, 0,153,51 )
			end
  		else
		  	outputChatBox ("Правильно: /answer (ид игрока) вопрос ", 255,255,255)
		end
	else
	  	outputChatBox ("Правильно: /answer (ид игрока) вопрос  ", 255,255,255)
	end
end

addCommandHandler ("answer", AnsQuestionChat)

--function showMyInfos ( source, cmd )
--	outputChatBox ("Ид: "..tostring(getElementData ( source, "playerid" ))..". Номер телефона: "..tostring(getElementData ( source, "phone" ))..". Денег на телефоне: "..tostring(getElementData ( source, "pmoney" )).."$",source, 0,153,51 )
--	outputChatBox ("Зрение: "..tostring(getElementData ( source, "vision" ))..". Интеллект: "..tostring(getElementData ( source, "intel" ))..". Удача: "..tostring(getElementData ( source, "luck" ))..". Вежливость: 0",source, 0,153,51 )
--	outputChatBox ("Преступлений: "..tostring(getElementData ( source, "crimes" ))..". Национальность: "..tostring(getElementData ( source, "nat" ))..". Возраст: "..tostring(getElementData ( source, "age" )).."",source, 0,153,51 )
--	outputChatBox ("Осталось сидеть в тюрьме: "..tostring(getElementData ( source, "arrest" ))..". Дом: "..tostring(getElementData ( source, "house" ))..". Возраст: "..tostring(getElementData ( source, "age" )).."",source, 0,153,51 )
--	outputChatBox ("Ваша ICQ: "..tostring(getElementData ( source, "icq" ))..". Ваш e-mail: "..tostring(getElementData ( source, "email" ))..". Варнов: "..tostring(getElementData ( source, "warn" )).."",source, 0,153,51 )
--    outputChatBox ("Фракция: "..tostring(factions[tonumber(getElementData(source,"faction"))][1] )..". Ранг: "..tostring(getElementData ( source, "rank" ))..". Работа: "..tostring(getElementData ( source, "work" )).."",source, 0,153,51 )
--end
--
--addCommandHandler ("infos", showMyInfos)

--function warpItPlayerPDDToCarS ( car )
--
--outputChatBox ("Подск1", 102,204,153 )
--    warpPedIntoVehicle ( source, car )
--
--end
--
--addEvent("warpItPDDToCar",true)
--addEventHandler("warpItPDDToCar",getRootElement(),warpItPlayerPDDToCarS)

carfortest = {}

function greetingHandler ( )
	carfortest[source] = createVehicle ( 404, 1148.64453125,1375.7490234375,10.419050216675 )
 	setElementRotation ( carfortest[source], 0,0,233.56466674805)
	setVehicleColor ( carfortest[source], 1, 3, 0, 0 )
	setElementData ( carfortest[source], "fuel", 100 )
    warpPedIntoVehicle ( source, carfortest[source] )
end
addEvent( "onGreeting", true )
addEventHandler( "onGreeting", getRootElement(), greetingHandler )

function onGreetingFinishS ( )
	destroyElement ( carfortest[source] )
end
addEvent( "onGreetingFinish", true )
addEventHandler( "onGreetingFinish", getRootElement(), onGreetingFinishS )

function playerNearPDD ( source )
	triggerClientEvent ( source, "instructionPDDMemoShow", getRootElement() )
end
