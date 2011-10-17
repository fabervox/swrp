----------------------------------------[СМИ]--------------------------------------------------

function StartBroadcasting( source, commandName )
		if ( getFactionInfo ( getElementData ( source, "faction" ), 17 ) == 5 ) then
			local newscar = getPedOccupiedVehicle ( source )
			if(isPedInVehicle(source)) then
    			if((getElementModel ( newscar ) == 488) or (getElementModel ( newscar ) == 582)) then
				    if ( tonumber(getElementData ( source, "radiodj" )) == nil ) or (  tonumber(getElementData ( source, "radiodj" )) == 0 ) then
						outputChatBox ("Вы вышли в прямой эфир",source, 72,193,243 )
						outputChatBox ("LVR: "..getPlayerName(source).." вышел в прямой эфир", 243,149,72 )
						setElementData ( source, "radiodj", 1)
					else
					    outputChatBox ("Вы покинули прямой эфир",source, 72,193,243 )
						outputChatBox ("LVR: "..getPlayerName(source).." покинул прямой эфир", 243,149,72 )
						setElementData ( source, "radiodj", 0)
					end
				else
					outputChatBox ("Ошибка: вы должны быть в машине новостей",source, 255,255,127 )
				end
			end
		else
			outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
		end
end

addCommandHandler ("broad", StartBroadcasting)

function InviteToBroadcast( source, commandName, ident )
	local playeronline
	if(ident) then
		if ( getFactionInfo ( getElementData ( source, "faction" ), 17 ) == 5 ) then
		    for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				local newscar = getPedOccupiedVehicle ( player )
					if(isPedInVehicle(player)) then
						if((getElementModel ( newscar ) == 488) or (getElementModel ( newscar ) == 582)) then
						    if ( tonumber(getElementData ( player, "radioguest" )) == nil ) or (  tonumber(getElementData ( player, "radioguest" )) == 0 ) then
								outputChatBox ("Вы вышли в прямой эфир",source, 72,193,243 )
								outputChatBox ("LVR: Гость "..getPlayerName(source).." вышел в прямой эфир", 243,149,72 )
								setElementData ( source, "radioguest", 1)
							else
							    outputChatBox ("Вы покинули прямой эфир",source, 72,193,243 )
								outputChatBox ("LVR: Гость "..getPlayerName(player).." покинул прямой эфир", 243,149,72 )
								setElementData ( source, "radioguest", 0)
							end
						else
							outputChatBox ("Ошибка: вы должны быть в машине новостей",source, 255,255,127 )
						end
					end
					playeronline = 1
				end
				if (playeronline == 0) then
					outputChatBox ("Этот игрок не в сети ",source, 255,255,127 )
				end
			end
		else
			outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
		end
    else
		outputChatBox ("Правильно: /invbroad ид игрока",source, 255,255,127 )
	end
end

addCommandHandler ("invtobroad", InviteToBroadcast)