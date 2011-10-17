
function invitePlayer( source, commandName, ident )
	local playeronline = 0
	if ( getElementData ( source, "rank" ) > 5 ) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( getElementData ( player, "playerid" ) ==  tonumber(ident) ) then
      			if ( getElementData ( player, "faction" ) == 0 ) then
			    	outputChatBox ("Вы пригласили игрока " .. getPlayerName(player) .. " в свою фракцию ",source, 255,255,127 )
					setElementData ( player, "faction", getElementData ( source, "faction" ) )
					setElementModel ( player, getFactionInfo( getElementData ( player, "faction" ), 12) )
					outputChatBox ("" .. getPlayerName(source) .. " пригласил вас во фракцию "..tostring(getFactionInfo( getElementData ( player, "faction" ), 1)).." ",player, 255,255,127 )
				else
					outputChatBox (" Этот игрок уже состоит во фракции ",source, 255,255,127 )
				end
				playeronline = 1
			end
		end
		if (playeronline == 0) then
			outputChatBox ("Этот игрок не в сети ",source, 255,255,127 )
		end
	else
	    outputChatBox ("Ошибка: У вас нету права приглашать игроков! ",source, 255,255,127 )
	end
end

addCommandHandler ("invite", invitePlayer)

function unInvitePlayer( source, commandName, ident )
	local playeronline = 0
	if getElementData ( source, "rank" ) == 5 then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( getElementData ( player, "playerid" ) ==  tonumber(ident) ) then
			    if ( getElementData ( player, "faction" ) == getElementData ( source, "faction" ) ) then
			    	outputChatBox ("" .. getPlayerName(source) .. " выгнал вас из фракции "..tostring(getFactionInfo( getElementData ( player, "faction" ), 1)).." ",player, 255,255,127 )
			    	outputChatBox ("Вы выгнали игрока " .. getPlayerName(player) .. " из своей фракции ",source, 255,255,127 )
					setElementData ( player, "faction", getElementData ( source, "faction" ) )
				else
					outputChatBox (" Этот игрок состоит не в вашей фракции ",source, 255,255,127 )
				end
				playeronline = 1

			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
    else
	   outputChatBox ("Ошибка: У вас нету прав выгонять игроков! ",source, 255,255,127 )
	end
end

addCommandHandler ("uninvite", unInvitePlayer)

function giveRankPlayer( source, commandName, ident, rank )
	local playeronline = 0
	if getElementData ( source, "rank" ) == 5  then
	    if (rank) then
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if ( getElementData ( player, "playerid" ) ==  tonumber(ident) ) then
				    if ( getElementData ( player, "faction" ) == getElementData ( source, "faction" ) ) then
				        if ( (tonumber(rank) < 6) and (tonumber(rank) > 0) ) then
				    		outputChatBox ("" .. getPlayerName(source) .. " дал вам ранг "..tostring(getFactionInfo( getElementData ( player, "faction" ), 6 + getElementData ( source, "rank" ))).." ",player, 255,255,127 )
				    		outputChatBox ("Вы дали игроку " .. getPlayerName(player) .. " новый ранг ",source, 255,255,127 )
							setElementData ( player, "rank", tonumber(rank) )
						else
							outputChatBox ("Ошибка: Ранг не может быть меньше 1 и больше 5 ",source, 255,255,127 )
						end
					else
						outputChatBox (" Этот игрок состоит не в вашей фракции ",source, 255,255,127 )
					end
					playeronline = 1

				end
				if (playeronline == 0) then
					outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
				end
			end
		else
        	outputChatBox ("Правильно: /giverank [id игрока] ранг ",source, 255,255,127 )
		end
    else
	   outputChatBox ("Ошибка: У вас нету прав давать ранг игрокам! ",source, 255,255,127 )
	end
end

addCommandHandler ("giverank", giveRankPlayer)

function FactionChat( source, commandName, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
	local playeronline = 0
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
  			 if ( getElementData ( player, "faction" ) == getElementData ( source, "faction" ) ) then
			    outputChatBox (""..tostring(getFactionInfo( getElementData ( source, "faction" ), 6 + getElementData ( source, "rank" ))).." " .. getPlayerName(source) .. ": "..text.." ",player, 42,204,255 )
			end
		end
	else
		outputChatBox ("Правильно: /f текст ", source,255,255,127 )
	end
end

addCommandHandler ("f", FactionChat)


function FactionBChat( source, commandName, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
	local playeronline = 0
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
  			 if ( tonumber(getElementData ( player, "faction" )) == tonumber(getElementData ( source, "faction" )) ) then
			    outputChatBox ("(( "..tostring(getFactionInfo( getElementData ( source, "faction" ), 6 + getElementData ( source, "rank" ))).." " .. getPlayerName(source) .. ": "..text.." ))",player, 55,204,255 )
			end
		end
	else
		outputChatBox ("Правильно: /f текст ", source,255,255,127 )
	end
end

addCommandHandler ("fb", FactionBChat)