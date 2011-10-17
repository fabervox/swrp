function GiveUdost( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
					if ( getElementData ( source, "duty" ) == 1 ) then
						outputChatBox ("-----------["..tostring(getFactionInfo(getElementData ( source, "faction" ), 17)).."]---------- ",player, 72,193,243 )
						outputChatBox ("Имя фамилия: " .. getPlayerName(source) .. " ",player, 255,255,127 )
						outputChatBox ("Должность: "..tostring(getFactionInfo(getElementData ( source, "faction" ),6+getElementData(source,"rank"))).."",player, 243,149,72 )
			    		outputChatBox ("-------------------------------------------- ",player, 72,193,243 )
			    		local x,y,z = getElementPosition( source )
			    		exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "показывает свое удостоверение игроку " .. getPlayerName(player) .. "" )
			    	else
			    		outputChatBox ("Ошибка: вы не взяли свое удостоверение ",source, 255,255,127 )
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
    	outputChatBox ("Правильно: /udost ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("udost", GiveUdost)

function DutyCop( source, commandName )
	if(exports.sweetyRP:playerToPoint(source, 3, 243,190,1008)) then
		if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
			if ( getElementData ( source, "duty" ) == 0) then
				outputChatBox ("Вы взяли свое оружие и значок ",source, 72,193,243 )
			    local x,y,z = getElementPosition( source )
			    setElementData ( source, "duty", 1)
			    exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "берет свой значок и оружие" )
			    giveWeapon ( source, 22, 50 )
			    giveWeapon ( source, 25, 15 )
			    giveWeapon ( source, 11 )
			else
				outputChatBox ("Вы положили свое оружие и значок ",source, 72,193,243 )
			    local x,y,z = getElementPosition( source )
			    setElementData ( source, "duty", 0)
			    exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "кладет обратно свой значок и оружие" )
			    takeWeapon ( source, 22 )
			    takeWeapon ( source, 25 )
			    takeWeapon ( source, 11 )
			end
		else
			outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
		end
	end
end

addCommandHandler ("duty", DutyCop)

function CuffPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
					if ( getElementData ( source, "duty" ) == 1 ) then
						if ( tonumber(getElementData ( player, "cuff" )) == nil ) or (  tonumber(getElementData ( player, "cuff" )) == 0 ) then
							outputChatBox ("Вы надели наручники на " .. getPlayerName(player) .. " ",source, 255,255,127 )
			    			toggleAllControls ( player, false, true, false )
			    			local x,y,z = getElementPosition( source )
			    			setElementData ( player, "cuff", 1)
			    			outputChatBox ("" .. getPlayerName(source) .. " одел наручники на вас.",player, 255,255,127 )
			    			exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "надел наручники на " .. getPlayerName(player) .. "" )
			    		else
			    			outputChatBox ("Вы сняли наручники с " .. getPlayerName(player) .. " ",source, 255,255,127 )
			    			toggleAllControls ( player, true )
			    			local x,y,z = getElementPosition( source )
			    			setElementData ( player, "cuff", 0)
			    			outputChatBox ("" .. getPlayerName(source) .. " снял наручники с вас.",player, 255,255,127 )
			    			exports.sweetyRP:sendActionMessage( source, x, y, z, 6, "снял наручники с " .. getPlayerName(player) .. "" )
			    		end
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
    	outputChatBox ("Правильно: /cuff ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("cuff", CuffPlayer)

function AttachCuffPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
					if ( getElementData ( source, "duty" ) == 1 ) then
						if ( tonumber(getElementData ( player, "cuff" )) == nil ) or (  tonumber(getElementData ( player, "cuff" )) == 0 ) then
							outputChatBox ("Сначала надо надеть наручники!",source, 255,255,127 )
			    		else
							attachElements ( player, source,0, 1 )
							outputChatBox ("" .. getPlayerName(player) .. " будет следовать за вами",source, 255,255,127 )
			    			outputChatBox ("Вы будете следовать за " .. getPlayerName(source) .. " ",player, 255,255,127 )
			    		end
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
    	outputChatBox ("Правильно: /acp ид игрока ", source,255,255,127 )
    end
end
addCommandHandler ("acp", AttachCuffPlayer)

function DetachCuffPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
					if ( getElementData ( source, "duty" ) == 1 ) then
						if ( tonumber(getElementData ( player, "cuff" )) == nil ) or (  tonumber(getElementData ( player, "cuff" )) == 0 ) then
							outputChatBox ("Сначала надо надеть наручники!",source, 255,255,127 )
			    		else
							detachElements ( player )
							outputChatBox ("Вы отпустили " .. getPlayerName(player) .. "",source, 255,255,127 )
			    			outputChatBox ("" .. getPlayerName(source) .. " отпустил вас",player, 255,255,127 )
			    		end
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
    	outputChatBox ("Правильно: /dacp ид игрока ", source,255,255,127 )
    end
end
addCommandHandler ("dacp", DetachCuffPlayer)

function GiveWanted( source, commandName, ident, ... )
	if(ident) then
		local playeronline = 0
		local parametersTable = {...}
	   	local text = table.concat(parametersTable, " ")
		if(text) then
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
					if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
						if ( getElementData ( source, "duty" ) == 1 ) then
							local wantlevel = getPlayerWantedLevel ( player )
							if ( wantlevel < 6) then
								setPlayerWantedLevel ( player, wantlevel + 1 )
								outputChatBox (" Вы дали розыск игроку "..getPlayerName(player).."",source, 240,240,240 )
								outputChatBox (" "..getPlayerName(source).." обьявил вас в розыск",player, 240,240,240 )
								for id, factionpl in ipairs ( getElementsByType ( "player" ) ) do
	  								if ( getFactionInfo(getElementData ( factionpl, "faction" ), 17 ) == 1 ) then
				    					outputChatBox ("Внимание всем! "..getPlayerName(player).." обьявлен в розыск!",factionpl, 55,204,255 )
				    					outputChatBox ("Преступление: "..tostring(text).."!",factionpl, 55,204,255 )
									end
								end
							else
								outputChatBox (" У этого игрока уже максимальный уровень розыска!",source, 240,240,240 )
							end
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
			outputChatBox ("Ошибка: введите преступление игрока!", source, 255,255,127 )
	    end
	 else
	   	outputChatBox ("Правильно: /su [ид игрока] преступление", source, 255,255,127 )
	end
end

addCommandHandler ("su", GiveWanted)

function EquipPlayerCop( eqnum )
	if(eqnum == 1) then
         giveWeapon ( source, 29, 200 )
		 outputChatBox ("Вы взяли MP5",source, 55,204,255 )
	end
	if(eqnum == 2) then
		 giveWeapon ( source, 27, 60 )
		 outputChatBox ("Вы взяли SPAZ-12",source, 55,204,255 )
	end
	if(eqnum == 3) then
		 giveWeapon ( source, 33, 30 )
		 outputChatBox ("Вы взяли деревенскую винтовку",source, 55,204,255 )
	end
	if(eqnum == 4) then
		 giveWeapon ( source, 34, 30 )
		 outputChatBox ("Вы взяли снайперскую винтовку",source, 55,204,255 )
	end
	if(eqnum == 5) then
		 giveWeapon ( source, 22, 50 )
		 outputChatBox ("Вы взяли Кольт-45",source, 55,204,255 )
	end
	if(eqnum == 6) then
		 giveWeapon ( source, 17, 5 )
		 outputChatBox ("Вы взяли газовые гранаты",source, 55,204,255 )
	end
	if(eqnum == 7) then
		 giveWeapon ( source, 23, 50 )
		 outputChatBox ("Вы взяли пистолет с глушителем",source, 55,204,255 )
	end
	if(eqnum == 8) then
		 giveWeapon ( source, 24, 50 )
		 outputChatBox ("Вы взяли Desert Eagle",source, 55,204,255 )
	end
	if(eqnum == 9) then
		 giveWeapon ( source, 16, 5 )
		 outputChatBox ("Вы взяли гранаты",source, 55,204,255 )
	end
	if(eqnum == 10) then
		 giveWeapon ( source, 43, 50 )
		 outputChatBox ("Вы взяли камеру",source, 55,204,255 )
	end
	if(eqnum == 11) then
		 giveWeapon ( source, 46)
		 outputChatBox ("Вы взяли парашут",source, 55,204,255 )
	end
	if(eqnum == 12) then
		 giveWeapon ( source, 36, 3 )
		 outputChatBox ("Вы взяли РПГ с теплонаведением",source, 55,204,255 )
	end
end

addEvent("EquipCop",true)
addEventHandler("EquipCop",root,EquipPlayerCop)

function ArrestPlayer( source, commandName, ident, artime )
	if(ident) then
		if(artime) then
			if((tonumber(artime) > 0) and (tonumber(artime) < 21)) then
				local playeronline = 0
				for id, player in ipairs ( getElementsByType ( "player" ) ) do
					if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
						if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
							if ( getElementData ( source, "duty" ) == 1 ) then
								if(exports.sweetyRP:playerToPoint(source, 5, 2295.7031,2452.0253,10.8203) or exports.sweetyRP:playerToPoint(source, 3, 201.2636,168.3466,1003.0234)) then
									local xs, ys, yz = getElementPosition(source)
									if(exports.sweetyRP:playerToPoint(player, 3, xs,ys,yz)) then
										local wantlevel = getPlayerWantedLevel ( player )
										if ( wantlevel > 0) then
											if ( tonumber(getElementData (player, "arrest")) == 0) then
												local prize = (wantlevel * 5000)
												setPlayerWantedLevel ( player, 0 )
												outputChatBox (" Вы арестовали игрока "..getPlayerName(player).."",source, 240,240,240 )
												outputChatBox (" Награда за арест: "..tostring(prize).." долларов",source, 240,240,240 )
												outputChatBox (" "..getPlayerName(source).." посадил вас на "..tostring(artime).."",player, 240,240,240 )
												local reshotka = math.random(1,3)
												if(reshotka == 1) then
													setElementPosition(player, 193.7729,175.3423,1003.0234)
												end
												if(reshotka == 2) then
													setElementPosition(player, 197.9603,174.7351,1003.0234)
												end
												if(reshotka == 3) then
													setElementPosition(player, 198.1102,162.5731,1003.0300)
												end
												givePlayerMoney ( source, prize )
												setElementInterior( player, 3)
												setElementData ( player, "arrest", tonumber(artime)*60000)
												for id, factionpl in ipairs ( getElementsByType ( "player" ) ) do
					  								if ( getFactionInfo(getElementData ( source, "faction" ), 17 ) == 1 ) then
								    					outputChatBox ("Внимание всем! "..getPlayerName(source).." посадил игрока "..getPlayerName(player).."!",factionpl, 55,204,255 )
								    					outputChatBox ("И получил за это награду "..tostring(prize).." доларов!",factionpl, 55,204,255 )
													end
												end
											else
												outputChatBox (" Этот игрок уже сидит!",source, 240,240,240 )
											end
										else
											outputChatBox (" Этот игрок не в розыске!",source, 240,240,240 )
										end
									else
										outputChatBox (" Этот игрок не рядом с вами!",source, 240,240,240 )
									end
								else
									outputChatBox (" Вы не рядом с местом ареста!",source, 240,240,240 )
								end
					    	else
					    		outputChatBox ("Ошибка: вы не на дежурстве ",source, 240,240,240 )
					    	end
						else
							outputChatBox ("Ошибка: вы не можете использовать эту команду ",source, 240,240,240 )
						end
					    playeronline = 1
					end
				end
				if (playeronline == 0) then
					outputChatBox (" Этот игрок не в сети ",source, 240,240,240 )
				end
			else
	   			outputChatBox ("Ошибка: время ареста не может быть больше 20 минут и меньше 1 минуты", source, 240,240,240 )
			end
		else
	   		outputChatBox ("Правильно: /arrest [ид игрока] время в минутах", source, 255,255,127 )
		end
	else
	   	outputChatBox ("Правильно: /arrest [ид игрока] время в минутах", source, 255,255,127 )
	end
end

addCommandHandler ("arrest", ArrestPlayer)


function ShowPlayerArrestTime ( source )
	local arresttime = (tonumber(getElementData ( source, "arrest" )) / 1000)
	outputChatBox ( " Вам осталось сидеть: "..tostring(arresttime).." секунд ", source )
end

addCommandHandler ("artime", ShowPlayerArrestTime)

findplayers={}

function FindPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
					if ( getElementData ( source, "duty" ) == 1 ) then
						local fpx, fpy, fpz = getElementPosition ( player )
						if((getElementInterior ( player ) == 0) and (fpz < 900))then
							if ( tonumber(getElementData ( source, "find" )) == nil ) or (  tonumber(getElementData ( source, "find" )) == 0 ) then
								local findmarker = createMarker ( fpx, fpy, fpz, "arrow", 0.5, 255,255,255 )
								local findblip = createBlip ( fpx, fpy, fpz, 60, 2, 255, 0, 0, 255, 0, 9999, source)
								findplayers[ident]={findmarker,findblip}
								attachElements ( findplayers[ident][1], player, 0,0,1.5)
								attachElements ( findplayers[ident][2], player)
								setElementVisibleTo ( findplayers[ident][1], getRootElement(), false )
								setElementVisibleTo ( findplayers[ident][1], source, true )
								outputChatBox("Спутник: Цель найдена, чтобы прекратить слежение - введите /stopfind ", source)
								setElementData ( source, "find", ident )
								setElementData ( player,"mefind", getElementData ( source, "playerid" ))
			    			else
			    					outputChatBox(" Вы уже ищите кого то ", source)
			    			end
			    		else
			    			outputChatBox ("Спутник: цель не найдена ",source, 255,255,127 )
			    		end
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
    	outputChatBox ("Правильно: /find ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("find", FindPlayer)

function StopFind( source, commandName )
	if ( tonumber(getElementData ( source, "find" )) > 0 ) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if(getElementData ( source,"find") == getElementData ( player, "playerid" )) then
				detachElements(findplayers[getElementData ( player, "playerid" )][1], player)
				detachElements(findplayers[getElementData ( player, "playerid" )][2], player)
				outputChatBox("Спутник: поиск окончен ",source)
				setElementData(player,"mefind", 0)
				clearElementVisibleTo ( findplayers[getElementData ( player, "playerid" )][1])
				clearElementVisibleTo ( findplayers[getElementData ( player, "playerid" )][2])
				destroyElement ( findplayers[getElementData ( player, "playerid" )][1] )
				destroyElement ( findplayers[getElementData ( player, "playerid" )][2] )
				setElementData(source,"find", 0)
			end
		end
	else
			outputChatBox("Вы никого не ищите ")
	end
end

addCommandHandler ("stopfind", StopFind)

function FriskPlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
					if ( getElementData ( source, "duty" ) == 1 ) then
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
			    		outputChatBox ("Ошибка: вы не на дежурстве ",source, 255,255,127 )
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
    	outputChatBox ("Правильно: /frisk ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("frisk", FriskPlayer)

function FreePlayer( source, commandName, ident )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( tonumber(getElementData ( player, "playerid" )) ==  tonumber(ident) ) then
				if(exports.sweetyRP:playerToPoint(source, 3, 201.2636,168.3466,1003.0234) ) then
					if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
						if(tonumber(getElementData ( source, "rank" )) > 2) then
							if ( getElementData ( source, "duty" ) == 1 ) then
								outputChatBox ( "Вас отпустил "..getPlayerName(source).."! ", player )
								setElementPosition(player, 201.2636,168.3466,1003.0234)
                                outputChatBox ( "Вы освободили "..getPlayerName(player).."! ", source )
                                setElementData(player, "arrest", 0)
					    	else
					    		outputChatBox ("Ошибка: вы не на дежурстве ",source, 255,255,127 )
					    	end
					    else
					    	outputChatBox ("Ошибка: у вас нету доступа к ключам!",source, 255,255,127 )
					    end
					else
						outputChatBox ("Ошибка: вы не можете использовать эту команду ",source, 255,255,127 )
					end
				else
					outputChatBox ("Ошибка: вы не там!",source, 255,255,127 )
				end
			    playeronline = 1
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
    	outputChatBox ("Правильно: /find ид игрока ", source,255,255,127 )
    end
end

addCommandHandler ("free", FreePlayer)

function MegaphoneChat( source, cmd, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
	    if getFactionInfo(getElementData ( source, "faction" ), 17) == 1 then
			local x,y,z = getElementPosition( source )
   			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if ( exports.sweetyRP:playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( "[" .. getPlayerName(source) .. ": "..text.."]", player,150,241,42 ) end
			end
		end
	else
	  		outputChatBox ("Правильно: /meg(aphone) текст ", 255,255,127 )
	end
end

addCommandHandler ("meg", MegaphoneChat)
addCommandHandler ("megaphone", MegaphoneChat)