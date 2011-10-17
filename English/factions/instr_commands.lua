function startSchoolLesson( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if ( getFactionInfo ( getElementData ( source, "faction" ), 17 ) == 6 ) then
				    local x, y, z = getElementPosition ( player )
					if ( getElementData ( player, "lesson" ) == 0 ) then
			    		exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "начал урок с игроком " .. getPlayerName(player) .. "" )
			    		setElementData ( player, "lesson", 1 )
			    		outputChatBox ("Информация: Начался урок, ваш инструктор: " .. getPlayerName(source) .. "",player, 0,153,51 )
			    		outputChatBox ("Информация: Урок начлся, ваш ученик: " .. getPlayerName(player) .. "",source, 0,153,51 )
			    	else
			    		outputChatBox ("Информация: Урок закончен",player, 0,153,51 )
			    		outputChatBox ("Информация: Урок закончен",source, 0,153,51 )
			    		setElementData ( player, "lesson", 0 )
			    	end
				else
					outputChatBox ("Ошибка: вы не можете использовать эту команду ",source, 255,255,127 )
				end
			    playeronline = 1
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
    	outputChatBox ("Правильно: /startlesson ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("startlesson", startSchoolLesson)

function giveLicension ( source, commandName, ident, licnum )
	local playeronline = 0
	if(ident) then
		if licnum then
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
					if ( getFactionInfo ( getElementData ( source, "faction" ), 17 ) == 6 ) then
						if ( getElementData ( source, "rank" ) > 1 )then
							local x, y, z = getElementPosition ( source )
							if tonumber(licnum) == 1 then
					    		sendActionMessage( source, x, y, z, 6, "выписал " .. getPlayerName(player) .. " лицензию на вождение авто" )
					    		setElementData ( player, "drive", 1 )
					    		outputChatBox ("Информация: " .. getPlayerName(source) .. " дал вам лицензию на вождение авто",player, 0,153,51 )
					    		outputChatBox ("Информация: Вы дали " .. getPlayerName(player) .. " лицензию на вождение авто",source, 0,153,51 )
				    		end
				    		if tonumber(licnum) == 2 then
				    			sendActionMessage( source, x, y, z, 6, "выписал " .. getPlayerName(player) .. " лицензию на управление воздушной техникой" )
					    		setElementData ( player, "fly", 1 )
					    		outputChatBox ("Информация: " .. getPlayerName(source) .. " дал вам лицензию на управление воздушной техникой",player, 0,153,51 )
					    		outputChatBox ("Информация: Вы дали " .. getPlayerName(player) .. " лицензию на управление воздушной техникой",source, 0,153,51 )
				    		end
				    		if tonumber(licnum) == 3 then
				    			sendActionMessage( source, x, y, z, 6, "выписал " .. getPlayerName(player) .. " лицензию на управление катером" )
					    		setElementData ( player, "boat", 1 )
					    		outputChatBox ("Информация: " .. getPlayerName(source) .. " дал вам лицензию на управление катером",player, 0,153,51 )
					    		outputChatBox ("Информация: Вы дали " .. getPlayerName(player) .. " лицензию на управление катером",source, 0,153,51 )
							end
							if tonumber(licnum) == 4 then
								sendActionMessage( source, x, y, z, 6, "выписал " .. getPlayerName(player) .. " лицензию на владение оружием" )
					    		setElementData ( player, "weapons", 1 )
					    		outputChatBox ("Информация: " .. getPlayerName(source) .. " дал вам лицензию на владение оружием",player, 0,153,51 )
					    		outputChatBox ("Информация: Вы дали " .. getPlayerName(player) .. " лицензию на владение оружием",source, 0,153,51 )
							end
				    	else
	                   		outputChatBox ("Ошибка: вы не можете использовать эту команду ",source, 255,255,127 )
				    	end
					else
						outputChatBox ("Ошибка: вы не можете использовать эту команду ",source, 255,255,127 )
					end
				    playeronline = 1
				end
			end
			if (playeronline == 0) then
				outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
			end
		else
			outputChatBox ("Правильно: /givelic [ид игрока] лицензия. 1 - права, 2 - вт, 3 - катер, 4 - оружие ", source,255,255,127 )
		end
	else
    	outputChatBox ("Правильно: /givelic [ид игрока] лицензия. 1 - права, 2 - вт, 3 - катер, 4 - оружие ", source,255,255,127 )
    end
end

addCommandHandler ("givelic", giveLicension)
