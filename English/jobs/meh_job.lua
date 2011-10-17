function mehStartDuty ( source, cmd, price1, price2 )
	if tonumber(getElementData ( source, "work" )) == 2 then
		if tonumber(getElementData ( source, "mehduty" )) == -1 or getElementData ( source, "mehduty" ) == nil then
			outputChatBox ("Информация: Вы вышли на дежурство!",source, 0,153,51 )
			setElementData ( source, "mehduty", price1 )
			setElementData ( source, "mehduty2", price2 )		
			outputChatBox ( " Механик " .. getPlayerName(source) .. " вышел на дежурство, телефон: ".. tostring(getElementData(source,"phone"))..", заправка: " .. tostring(price1) .. "$ ремонт:" .. tostring(price2) .. "" )
		else
			outputChatBox ("Информация: Вы ушли с дежурства",source, 0,153,51 )	
			setElementData ( source, "mehduty", -1 )	
		end
	end
end

addCommandHandler ("startmeh", mehStartDuty )

function fixPlayerCar ( source, commandName, ident )
	if tonumber(getElementData ( source, "mehduty2" )) > -1 then
	local playeronline = 0
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if isPedInVehicle ( player ) then
            		outputChatBox ("Информация: Вы предложили "..tostring(getPlayerName ( player )).." починить его машину",source, 0,153,51 )
            		outputChatBox ("Информация: "..tostring(getPlayerName ( source )).." предложил вам починить вашу машину. Цена: " .. tostring(getElementData ( source, "mehduty2")) .. "$",player, 0,153,51 )
            		triggerClientEvent ( player, "showFixAcceptMenu", player, getElementData ( source, "playerid" ), getElementData ( source, "mehduty2"))
				else
					outputChatBox ("Ошибкооо!!11!1 Этот игрок не в машине!!1!11!",source, 102, 0, 0)
				end
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
		outputChatBox ("Правильно: /fixhim [ид игрока] ", source, 255,255,127 )
	end
end

addCommandHandler ("fixhim", fixPlayerCar )

function completeFix( source, mehid, price )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if(getElementData(player, "playerid") == mehid) then
			if isPedInVehicle ( source ) then
				givePlayerMoney ( player, "price" )
				toggleAllControls ( player, true )
				toggleAllControls ( source, true )
				outputChatBox ("Информация: Вы починили машину игрока "..tostring(getPlayerName ( source ))..", и заработали "..tostring(price).."$",player, 0,153,51 )
           		outputChatBox ("Информация: "..tostring(getPlayerName ( player )).." починил вашу машину машину. Цена: " .. tostring(price) .. "$",source, 0,153,51 )
				setElementHealth ( getPedOccupiedVehicle ( source ), 1000 )
			end
		end
	end
end

function completeFix1 ( mehid, price )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if(tonumber(getElementData(player, "playerid")) == mehid) then
			outputChatBox ("Информация: Вы чините машину игрока "..tostring(getPlayerName ( source )).."",player, 0,153,51 )
   			toggleAllControls ( source, false, true, false )
   			toggleAllControls ( player, false, true, false )
   			setTimer ( completeFix, 5000, 1, source, mehid, price )
		end
	end
end

addEvent("completeFixing",true)
addEventHandler("completeFixing",root,completeFix1)

function fillPlayerCar ( source, commandName, ident )
	if tonumber( getElementData ( source, "mehduty" )) > -1 then
	local playeronline = 0
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if isPedInVehicle ( player ) then
            		outputChatBox ("Информация: Вы предложили "..tostring(getPlayerName ( player )).." починить его машину",source, 0,153,51 )
            		outputChatBox ("Информация: "..tostring(getPlayerName ( source )).." предложил вам починить вашу машину. Цена: " .. tostring(getElementData ( source, "mehduty")) .. "$",player, 0,153,51 )
            		triggerClientEvent ( player, "showFillAcceptMenu", player, getElementData ( source, "playerid" ), getElementData ( source, "mehduty"))
				else
					outputChatBox ("Ошибкооо!!11!1 этот игрок не в машине!!1!11!",source, 102, 0, 0)
				end
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
		outputChatBox ("Правильно: /fillhim [ид игрока] ", source, 255,255,127 )
	end
end

addCommandHandler ("fillhim", fillPlayerCar )

function completeFill( source, mehid, price )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if(getElementData(player, "playerid") == mehid) then
			if isPedInVehicle ( source ) then
				givePlayerMoney ( player, "price" )
				toggleAllControls ( source, true )
				outputChatBox ("Информация: Вы заправили машину игрока "..tostring(getPlayerName ( source ))..", и заработали "..tostring(price).."$",player, 0,153,51 )
           		outputChatBox ("Информация: "..tostring(getPlayerName ( player )).." заправил вашу машину машину. Цена: " .. tostring(price) .. "$",source, 0,153,51 )
				setElementData ( getPedOccupiedVehicle ( source ), "fuel", 100 )
			end
		end
	end
end

function completeFuel1 ( mehid, price )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if(getElementData(player, "playerid") == mehid) then
			outputChatBox ("Информация: Вы заправляете машину игрока "..tostring(getPlayerName ( source )).."",player, 0,153,51 )
   			toggleAllControls ( source, false, true, false )
   			setTimer ( completeFill, 5000, 1, source, mehid, price )
		end
	end
end

addEvent("completeFueling",true)
addEventHandler("completeFueling",root,completeFuel1)