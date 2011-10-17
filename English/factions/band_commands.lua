function TiePlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if ( getFactionInfo ( getElementData(source, "faction"), 17 ) == 2) or (tonumber(getElementData ( source, "tie" )) == 1) then
					if ( tonumber(getElementData ( player, "tied" )) == nil ) or (  tonumber(getElementData ( player, "tied" )) == 0 ) then
						outputChatBox ("Вы связали " .. getPlayerName(player) .. " ",source, 255,255,127 )
			    		toggleAllControls ( player, false, true, false )
			    		local x,y,z = getElementPosition( source )
			    		setElementData ( player, "tied", 1)
			    		outputChatBox ("" .. getPlayerName(source) .. " связал вас.",player, 255,255,127 )
			    		exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "связал " .. getPlayerName(player) .. "" )
			    	else
			    		outputChatBox ("Вы развязали " .. getPlayerName(player) .. " ",source, 255,255,127 )
			    		toggleAllControls ( player, true )
			    		local x,y,z = getElementPosition( source )
			    		setElementData ( player, "tied", 0)
			    		outputChatBox ("" .. getPlayerName(source) .. " развязал вас.",player, 255,255,127 )
			    		exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "снял веревки с " .. getPlayerName(player) .. "" )
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
    	outputChatBox ("Правильно: /tie ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("tie", TiePlayer)

function BeatPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if ( getFactionInfo ( getElementData(source, "faction"), 17 ) == 2 ) then
					if ( getElementHealth ( player ) < 20 ) then
					local fpx, fpy, fpz = getElementPosition ( source )
						if(exports.sweetyRP:playerToPoint(player,2,fpx,fpy,fpz)) then
							local weaponType1 = getPedWeapon ( player, 1 )
					    	local weaponType2 = getPedWeapon ( player, 2 )
					    	local weaponType3 = getPedWeapon ( player, 3 )
					    	local weaponType4 = getPedWeapon ( player, 4 )
					    	local weaponType5 = getPedWeapon ( player, 5 )
					    	local weaponType6 = getPedWeapon ( player, 6 )
					    	local weaponType7 = getPedWeapon ( player, 7 )
					    	local weaponType8 = getPedWeapon ( player, 8 )
					    	local playerlucky = getElementData(player, "luck")
					    	local noweapon
					    	if(tonumber(playerlucky) < 7) then
					    		noweapon = math.random(0,400)
							end
					    	if((tonumber(playerlucky) > 6) and (tonumber(playerlucky) < 10)) then
					    		noweapon = math.random(0,100)
					    	end
					    	if((tonumber(playerlucky) > 9) and (tonumber(playerlucky) < 20)) then
					    		noweapon = math.random(0,50)
					    	end
					    	if(tonumber(playerlucky) > 19) then
								noweapon = math.random(0,20)
					    	end
					    	local findweapon
					    	local playervision = tonumber(getElementData(source, "vision"))
					    	if(tonumber(playervision) < 7) then
					    	    findweapon = math.random(0,18)
							end
					    	if((playervision > 6) and (playervision < 10)) then
					    		findweapon = math.random(0,20)
					    	end
					    	if((playervision > 9) and (playervision < 20)) then
					    		findweapon = math.random(0,35)
					    	end
					    	if(playervision > 19) then
								findweapon = math.random(0,60)
					    	end
					    	local findsucces
					    	if(weaponType1 > 0) then
					    		if((tonumber(noweapon) > 15) or (tonumber(findweapon) > 17)) then
					    			outputChatBox ("Найдено ручное оружие! "..getWeaponNameFromID ( weaponType1 ).."",source, 243,149,72 )
					    			findsucces = 1
					    		end
					    	end
					    	if(weaponType2 > 0) then
					    		if((tonumber(noweapon) > 13) or (tonumber(findweapon) > 15)) then
					    			outputChatBox ("Найдено легкое оружие! "..getWeaponNameFromID ( weaponType2 ).."",source, 243,149,72 )
					    			findsucces = 1
					    		end
					    	end
					    	if(weaponType3 > 0) then
					    		if((tonumber(noweapon) > 5) or (tonumber(findweapon) > 5)) then
					    			outputChatBox ("Найдено ружье! "..getWeaponNameFromID ( weaponType3 ).."",source, 243,149,72 )
					    			findsucces = 1
					    		end
					    	end
					    	if(weaponType4 > 0) then
					    		if((tonumber(noweapon) > 7) or (tonumber(findweapon) > 10)) then
					    			outputChatBox ("Найден легкий автомат! "..getWeaponNameFromID ( weaponType4 ).."",source, 243,149,72 )
					    			findsucces = 1
					    		end
					    	end
					    	if(weaponType5> 0) then
					    		if((tonumber(noweapon) > 2) or (tonumber(findweapon) > 5))then
					    			outputChatBox ("Найден автомат! "..getWeaponNameFromID ( weaponType5 ).."",source, 243,149,72 )
					    			findsucces = 1
					    		end
					    	end
					    	if(weaponType6 > 0) then
					    		if((tonumber(noweapon) > 2) or (tonumber(findweapon) > 5)) then
					    			outputChatBox ("Найдена винтовка! "..getWeaponNameFromID ( weaponType6 ).."",source, 243,149,72 )
					    			findsucces = 1
					    		end
					    	end
					    	if(weaponType7 > 0) then
					    		outputChatBox ("Найдено тяжелое оружие! "..getWeaponNameFromID ( weaponType7 ).."",source, 243,149,72 )
								findsucces = 1
					    	end
					    	if(weaponType8 > 0) then
					    		if((tonumber(noweapon) > 15) or (tonumber(findweapon) > 10)) then
					    			outputChatBox ("Найдена граната! "..getWeaponNameFromID ( weaponType8 ).."",source, 243,149,72 )
									findsucces = 1
					    		end
					    	end
					    	if(tonumber(getElementData(player,"passport")) > 0) then
					    		if((tonumber(noweapon) > 15) or (tonumber(findweapon) > 15)) then
					    			outputChatBox ("Найден пасспорт гражданина "..getPlayerName( player ).."!",source, 243,149,72 )
									findsucces = 1
					    		end
					    	end
					    	local playerdrugs = tonumber(getElementData(player, "drugs"))
					    	if(playerdrugs > 0) then
					    		if((tonumber(noweapon) > 15) or (tonumber(findweapon) > 15) or (playerdrugs > 500)) then
					    			outputChatBox ("Найдены наркотики!!! "..tostring(playerdrugs).." грамм!",source, 243,149,72 )
									findsucces = 1
					    		end
					    	end
					    	local playerweapmat = tonumber(getElementData(player, "weapmat"))
					    	if(playerweapmat > 0) then
					    		if((tonumber(noweapon) > 15) or (tonumber(findweapon) > 15) or (playerweapmat > 20)) then
					    			outputChatBox ("Найдены материалы для оружия! "..tostring(playerweapmat).." деталей!",source, 243,149,72 )
								    findsucces = 1
					    		end
					    	end
					    	if (findsucces ~= 1) then
					    		outputChatBox ("Ничего не найдено!",source, 243,149,72 )
					    	end
					    	outputChatBox ( "Вас обыскивает "..getPlayerName(source).."! ", player )
                            outputChatBox ( "Вы обыскиваете "..getPlayerName(player).."! ", source )
                            exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "обыскал " .. getPlayerName(player) .. "" )
					   	else
			    			outputChatBox ("Ошибка: игрок не рядом с вами ",source, 255,255,127 )
			    		end
			    	else
			    		outputChatBox ("Ошибка: сначала надо избить игрока! ",source, 255,255,127 )
			    	end
				else
					outputChatBox ("Ошибка: вы не можете использовать эту команду ",source, 255,255,127 )
				end
			    playeronline = 1
			end
		end
		if (playeronline == 0) then
			outputChatBox ("Этот игрок не в сети ",source, 255,255,127 )
		end
	else
    	outputChatBox ("Правильно: /beat ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("beat", BeatPlayer)

function ClapPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if getFactionInfo(getElementData ( source, "faction" ), 17) == 2 then
					if ( tonumber(getElementData ( player, "clap" )) == nil ) or (  tonumber(getElementData ( player, "clap" )) == 0 ) then
			    		outputChatBox ("Вы вставили кляп в рот " .. getPlayerName(player) .. " ",source, 255,255,127 )
			    		local x,y,z = getElementPosition( source )
			    		setElementData ( player, "clap", 1)
			    		outputChatBox ("" .. getPlayerName(source) .. " вставил кляп вам в рот.",player, 255,255,127 )
			    		exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "вставил кляп в рот " .. getPlayerName(player) .. "" )
			    	else
			    		outputChatBox ("Вы убрали кляп из рта " .. getPlayerName(player) .. " ",source, 255,255,127 )
			    		local x,y,z = getElementPosition( source )
			    		setElementData ( player, "clap", 0)
			    		outputChatBox ("" .. getPlayerName(source) .. " убрал кляп из вашего рта.",player, 255,255,127 )
			    		exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "убрал кляп из рта " .. getPlayerName(player) .. "" )
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
    	outputChatBox ("Правильно: /clap ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("clap", ClapPlayer)

function SetLeaderPlayer( source, commandName, ident, fact )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				setElementData ( player, "faction", tonumber(fact))
				setElementData ( player, "rank", 5)
				setElementModel ( player, getFactionInfo ( tonumber(fact), 16 ))
			    playeronline = 1
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
    	outputChatBox ("Правильно: /clap ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("setleader", SetLeaderPlayer)
