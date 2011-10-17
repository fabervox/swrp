function HealPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if ( getFactionInfo ( getElementData ( source, "faction" ), 17 )== 3 ) then
					if ( getElementData ( source, "duty" ) == 1 ) then
							outputChatBox ("Вы вылечили " .. getPlayerName(player) .. " ",source, 255,255,127 )
			    			local x,y,z = getElementPosition( source )
			    			outputChatBox ("" .. getPlayerName(source) .. " вылечил вас.",player, 255,255,127 )
			    			sendActionMessage( source, x, y, z, 6, "вылечил " .. getPlayerName(player) .. "" )
			    			setElementHealth ( player, 100 )
			    	else
			    		outputChatBox ("Ошибка: вы не на дежурстве ",source, 255,255,127 )
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
    	outputChatBox ("Правильно: /heal ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("heal", HealPlayer)