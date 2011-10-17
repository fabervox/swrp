addEventHandler ( "onResourceStart", getRootElement(), function () copbarrier = createObject ( 968, 2238.2, 2450.4064, 10.6131, 0, 90, 90 ) end )

function LoadAccountS ( pass )
	local RootNode = xmlLoadFile ( ":players/Accounts/"..tostring(getPlayerName(source))..".xml" )
	local playerpass = xmlFindChild ( RootNode, "password", 0 )
	local password = xmlNodeGetValue ( playerpass )
	if(password == pass) then
		--spawnPlayer(source, 1666.3212890625,1473.9931640625,10.775390625)
		setElementData ( source, "playerid", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "id", 0 ) ) ) )
		setPlayerMoney ( source, xmlNodeGetValue (  xmlFindChild ( RootNode, "money", 0 ) ) )
		setElementData ( source, "bmoney", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bmoney", 0 ) ) ) )
		setElementData ( source, "admlvl", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "admin", 0 ) ) ) )
		setElementData ( source, "rplvl", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "rplvl", 0 ) ) ) )
		setElementData ( source, "warn", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "warn", 0 ) ) ) )
		setElementData ( source, "faction", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "faction", 0 ) ) ) )
		setElementData ( source, "rank", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "rank", 0 ) ) ) )
		setElementData ( source, "phone", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "phone", 0 ) ) ) )
		setElementData ( source, "pmoney", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "pmoney", 0 ) ) ) )
		setElementData ( source, "work", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "work", 0 ) ) ) )
		setElementData ( source, "age", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "age", 0 ) ) ) )
		setElementData ( source, "skin", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "skin", 0 ) ) ) )
		setElementData ( source, "passport", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "passport", 0 ) ) ) )
		setElementData ( source, "crimes", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "crimes", 0 ) ) ) )
		setElementData ( source, "arrest", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "arrest", 0 ) ) ) )
		setElementData ( source, "weapons", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weapons", 0 ) ) ) )
		setElementData ( source, "weapmat", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weapmat", 0 ) ) ) )
		setElementData ( source, "drugs", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "drugs", 0 ) ) ) )
		setElementData ( source, "origin", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "origin", 0 ) ) ) )
		setElementData ( source, "house", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "house", 0 ) ) ) )
		setElementData ( source, "icq", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "icq", 0 ) ) ) )
		setElementData ( source, "email", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "e-mail", 0 ) ) ) )
		setElementData ( source, "intel", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "intel", 0 ) ) ) )
		setElementData ( source, "luck", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "luck", 0 ) ) ) )
		setElementData ( source, "vision", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "vision", 0 ) ) ) )
		setElementData ( source, "health", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "health", 0 ) ) ) )
		setElementData ( source, "sex", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "sex", 0 ) ) ) )
		setElementData ( source, "nat", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "nat", 0 ) ) ) )
		setElementData ( source, "page", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "page", 0 ) ) ) )
		setElementData ( source, "rentcar", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "rentcar", 0 ) ) ) )
		setElementData ( source, "drive", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "drive", 0 ) ) ) )
		setElementData ( source, "fly", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "fly", 0 ) ) ) )
		setElementData ( source, "boat", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "boat", 0 ) ) ) )
		setElementData ( source, "houserent", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "houserent", 0 ) ) ) )
		setElementData ( source, "duty", 0)
		setElementData ( source, "logged", true )
		setCameraTarget (source, source)
		playerskin = getElementData ( source, "skin" )
		spawnPlayer(source, 1666.3212890625,1473.9931640625,10.775390625, playerskin)
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap1", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo1", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap2", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo2", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap3", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo3", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap4", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo4", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap5", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo5", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap6", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo6", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap7", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo7", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap8", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo8", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap9", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo9", 0 ) )), true )
		giveWeapon ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "weap10", 0 ) )) , tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ammo10", 0 ) )), true )
  		setElementData ( source, "bunk1", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk1", 0 ) ) ) )
       	setElementData ( source, "bunk2", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk2", 0 ) ) ) )
       	setElementData ( source, "bunk3", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk3", 0 ) ) ) )
       	setElementData ( source, "bunk4", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk4", 0 ) ) ) )
       	setElementData ( source, "bunk5", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk5", 0 ) ) ) )
       	setElementData ( source, "bunk6", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk6", 0 ) ) ) )
       	setElementData ( source, "bunk7", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk7", 0 ) ) ) )
       	setElementData ( source, "bunk8", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk8", 0 ) ) ) )
       	setElementData ( source, "bunk9", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk9", 0 ) ) ) )
       	setElementData ( source, "bunk10", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk10", 0 ) ) ) )
       	setElementData ( source, "bunk11", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk11", 0 ) ) ) )
       	setElementData ( source, "bunk12", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk12", 0 ) ) ) )
       	setElementData ( source, "bunk13", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk13", 0 ) ) ) )
       	setElementData ( source, "bunk14", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk14", 0 ) ) ) )
       	setElementData ( source, "bunk15", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk15", 0 ) ) ) )
       	setElementData ( source, "bunk16", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk16", 0 ) ) ) )
       	setElementData ( source, "bunk17", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk17", 0 ) ) ) )
       	setElementData ( source, "bunk18", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk18", 0 ) ) ) )
       	setElementData ( source, "bunk19", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk19", 0 ) ) ) )
       	setElementData ( source, "bunk20", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "bunk20", 0 ) ) ) )
       	setElementData ( source, "totalbunks", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "totalbunks", 0 ) ) ) )
  		setElementData ( source, "ach1", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach1", 0 ) ) ) )
       	setElementData ( source, "ach2", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach2", 0 ) ) ) )
       	setElementData ( source, "ach3", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach3", 0 ) ) ) )
       	setElementData ( source, "ach4", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach4", 0 ) ) ) )
       	setElementData ( source, "ach5", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach5", 0 ) ) ) )
       	setElementData ( source, "ach6", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach6", 0 ) ) ) )
       	setElementData ( source, "ach7", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach7", 0 ) ) ) )
       	setElementData ( source, "ach8", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach8", 0 ) ) ) )
       	setElementData ( source, "ach9", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach9", 0 ) ) ) )
       	setElementData ( source, "ach10", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach10", 0 ) ) ) )
       	setElementData ( source, "ach11", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach11", 0 ) ) ) )
       	setElementData ( source, "ach12", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach12", 0 ) ) ) )
       	setElementData ( source, "ach13", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach13", 0 ) ) ) )
       	setElementData ( source, "ach14", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach14", 0 ) ) ) )
       	setElementData ( source, "ach15", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach15", 0 ) ) ) )
       	setElementData ( source, "ach16", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach16", 0 ) ) ) )
       	setElementData ( source, "ach17", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach17", 0 ) ) ) )
       	setElementData ( source, "ach18", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach18", 0 ) ) ) )
       	setElementData ( source, "ach19", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach19", 0 ) ) ) )
       	setElementData ( source, "ach20", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach20", 0 ) ) ) )
       	setElementData ( source, "ach21", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach21", 0 ) ) ) )
       	setElementData ( source, "ach22", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach22", 0 ) ) ) )
       	setElementData ( source, "ach23", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "ach23", 0 ) ) ) )
       	setElementData ( source, "points", tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "points", 0 ) ) ) )
		outputChatBox ( "Ваш ИД: " .. tostring(getElementData ( source, "playerid" )) .. " ", source)
		outputChatBox ( "" .. getPlayerName(source) .. " зашел на наш сервер ", getRootElement(), 102,204,204)
		bindKey ( source, "space", "up", spaceEvents )
		bindKey ( source, "horn", "down", openBarriers )
--        triggerClientEvent ( "showMainGUI", source)
		setElementModel ( source, tonumber(xmlNodeGetValue (  xmlFindChild ( RootNode, "skin", 0 ) ) )  )
		setElementData (source, "robcomplete", 0 )
		setElementData (source, "taxipas", 0 )
		setElementData (source, "call", 0 )
		setElementData (source, "taxiduty", 0 )
		setElementData (source, "mehduty", 0 )
		setElementData (source, "trydo", 0 )
		setElementData (source, "online", 1 )
		setElementData (source, "mefind", 0 )
		setElementData (source, "trailerwork", 0 )
 		setElementData (source, "cartest", 0 )
 		setElementData (source, "lesson", 0 )
 		setElementData (source, "fuelshow", 0 )
		showPlayerHudComponent ( source, "radar", true )
		setElementData ( source, "ID", getElementData ( source, "playerid" ) )
	    call(getResourceFromName("scoreboard"), "addScoreboardColumn", "ID")
		local account = getAccount ( getPlayerName(source), password ) -- Return the account
		if ( account ~= false ) then -- If the account exists.
			logIn ( source, account, password )
		end
		local vehicles = getElementsByType ( "vehicle" ) -- get a table of all the players in the server
		for theKey,theCar in ipairs(vehicles) do -- use a generic for loop to step through each player
		   if theKey == getElementData ( source,"rentcar" ) then
		        if getElementData ( theCar, "owner" ) == 0 then
		        	setElementData ( source, "rentcar", 0 )
		        	outputChatBox ("Информация: Аренда машины закончилась", source, 0,153,51 )
		        end
		    end
		end
		local spawnsucces
--		playerskin = tonumber(getElementData ( source, "skin" ))
--		createZombie( 1666.3212890625,1473.9931640625,10.775390625 )
		if(tonumber(getElementData ( source, "arrest" )) > 0) then
			local arresttime = (tonumber(getElementData ( source, "arrest" )) / 1000)
			outputChatBox ( "Внимание! Вы не досидели свой срок! ", source )
			outputChatBox ( "Вам осталось сидеть: "..tostring(arresttime).." секунд ", source )
			local reshotka = math.random(1,3)
			if(reshotka == 1) then
				spawnPlayer(source, 193.7729,175.3423,1003.0234, 0, playerskin)
			end
			if(reshotka == 2) then
				spawnPlayer(source, 197.9603,174.7351,1003.0234, 0, playerskin)
			end
			if(reshotka == 3) then
				spawnPlayer(source, 198.1102,162.5731,1003.0300, 0, playerskin)
			end
			setElementInterior( source, 3)
			spawnsucces = 1
			return true
		end
		local house = getElementData ( source, "house" )
		local houserent = getElementData ( source, "houserent" )
		if house > 0 or houserent > 0 then
			--spawnPlayer(source, 2152.5303,2045.3932,17.1303, 0, playerskin)
		    exports.houses:enterHouse ( source, house )
		    spawnsucces = 1
			return true
  		end
  		if houserent > 0 then
  			exports.houses:enterHouse ( source, houserent )
			outputChatBox ("Информация: вы арендуете дом за "..tostring(getElementData ( exports.houses:getHouse(houserent), "rentprice" )).."$", source, 0,153,51 )
			spawnsucces = 1
			return true
		end
		if(tonumber(getElementData ( source, "faction" )) > 0) then
			local pfact = getElementData ( source, "faction" )
			local x = exports.factions:getFactionInfo( pfact, 4 )
			local y = exports.factions:getFactionInfo( pfact, 5 )
			local z = exports.factions:getFactionInfo( pfact, 6 )
	    	spawnPlayer(source, x,y,z, 0, playerskin)
	    	setElementData (source, "facttype", exports.factions:getFactionInfo( pfact, 17 ))
			if (( tonumber(exports.factions:getFactionInfo( pfact, 17 )) == 1 ) or (tonumber(exports.factions:getFactionInfo( pfact, 17 )) == 4)) then
				setElementInterior( source, 3)
			end
			outputChatBox ( "Вы состоите во фракции "..tostring(exports.factions:getFactionInfo( pfact, 1 )).." ", source, 255,51,0 )
			outputChatBox ( "Ваш ранг: "..tostring(exports.factions:getFactionInfo( pfact, 6+tonumber(getElementData ( source,"rank")))).." ", source )
			spawnsucces = 1
		end
  		if spawnsucces ~= 1 then
			spawnPlayer(source, 1666.3212890625,1473.9931640625,10.775390625, 0, playerskin)
		end
	end
end
addEvent("LoadAccountС",true)
addEventHandler("LoadAccountС",root,LoadAccountS)


quit_Type = {Unknown = "Неизвестно", Quit = "Выход", Kicked = "Кикнут", Banned = "Забанен", ["Bad Connection"] = "Плохое соединение", ["Timed out"] = "Тайм-аут"}
function outputChatBoxTypeQuitPlayer(quitType, reason, ResponsibleElement)
	local xmlPlayers = xmlLoadFile ( ":players/Accounts/"..tostring(getPlayerName(source))..".xml" )
	if(getElementData(source, "online" ) == 1) then
		saveAccount ( source )
	end
	if((tonumber(getElementData ( source, "mefind" )) ~= nil) and (tonumber(getElementData(source, "mefind")) > 0)) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if(getElementData ( source,"mefind") == getElementData ( player, "playerid" )) then
				detachElements(findplayers[getElementData ( source, "playerid" )][1], source)
				detachElements(findplayers[getElementData ( source, "playerid" )][2], source)
				outputChatBox("Спутник: Обьект покинул игру, поиск окончен",player)
				setElementData(source,"mefind", 0)
				clearElementVisibleTo ( findplayers[getElementData ( source, "playerid" )][1])
				clearElementVisibleTo ( findplayers[getElementData ( source, "playerid" )][2])
				destroyElement ( findplayers[getElementData ( source, "playerid" )][1] )
				destroyElement ( findplayers[getElementData ( source, "playerid" )][2] )
				setElementData(player,"find", 0)
			end
		end
	end
 if (quit_Type[quitType] == "Выход") or (quit_Type[quitType] == "Неизвестно") or (quit_Type[quitType] == "Плохое соединение") or (quit_Type[quitType] == "Тайм-аут") then
  outputChatBox("Игрок "..getPlayerName(source).." покинул наш сервер. Причина: "..quit_Type[quitType].."",getRootElement(), 204, 0, 0)
 else
  if reason then
   theReason = reason
  else
   theReason = "Неизвестно"
  end
 end
end
addEventHandler("onPlayerQuit", getRootElement(), outputChatBoxTypeQuitPlayer)

function saveAccount ( source )
	local xmlPlayers = xmlLoadFile ( ":players/Accounts/"..tostring(getPlayerName(source))..".xml" )
	if(getElementData(source, "online" ) == 1) then
		local plid = xmlFindChild ( xmlPlayers, "id", 0 )
		xmlNodeSetValue ( plid, ""..tostring(getElementData ( source, "playerid" )).."" )
		local plmoney = xmlFindChild ( xmlPlayers, "money", 0 )
		xmlNodeSetValue ( plmoney, ""..tostring(getPlayerMoney ( source )).."" )
		local plbmoney = xmlFindChild ( xmlPlayers, "bmoney", 0 )
		xmlNodeSetValue ( plbmoney, ""..tostring(getElementData ( source, "bmoney" )) .."")
		local pldrive = xmlFindChild ( xmlPlayers, "drive", 0 )
		xmlNodeSetValue ( pldrive, ""..tostring(getElementData ( source, "drive" )) .."")
		local plfly = xmlFindChild ( xmlPlayers, "fly", 0 )
		xmlNodeSetValue ( plfly, ""..tostring(getElementData ( source, "fly" ) ) .."")
		local plboat = xmlFindChild ( xmlPlayers, "boat", 0 )
		xmlNodeSetValue ( plboat, ""..tostring(getElementData ( source, "boat" ) ) .."")
		xmlNodeSetValue ( xmlFindChild ( xmlPlayers, "admin", 0 ), ""..tostring(getElementData ( source, "admlvl" )).."" )
		local plrplvl = xmlFindChild ( xmlPlayers, "rplvl", 0 )
		xmlNodeSetValue ( plrplvl, ""..tostring(getElementData ( source, "rplvl" )) .."")
		local plwarn = xmlFindChild ( xmlPlayers, "warn", 0 )
		xmlNodeSetValue ( plwarn, ""..tostring(getElementData ( source, "warn" )) .."")
        local plfaction = xmlFindChild ( xmlPlayers, "faction", 0 )
		xmlNodeSetValue ( plfaction, ""..tostring(getElementData ( source, "faction" )) .."")
        local plrank = xmlFindChild ( xmlPlayers, "rank", 0 )
		xmlNodeSetValue ( plrank, ""..tostring(getElementData ( source, "rank" ) ) .."")
        local plphone = xmlFindChild ( xmlPlayers, "phone", 0 )
		xmlNodeSetValue ( plphone, ""..tostring(getElementData ( source, "phone" )).."")
		local plpmoney = xmlFindChild ( xmlPlayers, "pmoney", 0 )
		xmlNodeSetValue ( plpmoney, ""..tostring(getElementData ( source, "pmoney" )).."" )
        local plwork = xmlFindChild ( xmlPlayers, "work", 0 )
		xmlNodeSetValue ( plwork, ""..tostring(getElementData ( source, "work" )).."")
		local plage = xmlFindChild ( xmlPlayers, "age", 0 )
		xmlNodeSetValue ( plage, ""..tostring(getElementData ( source, "age" )).."")
		local plskin = xmlFindChild ( xmlPlayers, "skin", 0 )
		xmlNodeSetValue ( plskin, ""..tostring(getElementModel ( source )).."")
		local plpassport = xmlFindChild ( xmlPlayers, "passport", 0 )
		xmlNodeSetValue ( plpassport, ""..tostring(getElementData ( source, "passport" )).."")
		local plcrimes = xmlFindChild ( xmlPlayers, "crimes", 0 )
		xmlNodeSetValue ( plcrimes, ""..tostring(getElementData ( source, "crimes" )).."")
		local plarrest = xmlFindChild ( xmlPlayers, "arrest", 0 )
		xmlNodeSetValue ( plarrest, ""..tostring(getElementData ( source, "arrest" )).."")
        local plweaplic = xmlFindChild ( xmlPlayers, "weapons", 0 )
		xmlNodeSetValue ( plweaplic, ""..tostring(getElementData ( source, "weapons" ) ).."")
		local plweapmat = xmlFindChild ( xmlPlayers, "weapmat", 0 )
		xmlNodeSetValue ( plweapmat, ""..tostring(getElementData ( source, "weapmat" )).."")
		local pldrugs = xmlFindChild ( xmlPlayers, "drugs", 0 )
		xmlNodeSetValue ( plweapmat, ""..tostring(getElementData ( source, "drugs" )).."")
		local plorigin = xmlFindChild ( xmlPlayers, "origin", 0 )
		xmlNodeSetValue ( plorigin, ""..tostring(getElementData ( source, "origin" )).."")
		local plhouse = xmlFindChild ( xmlPlayers, "house", 0 )
		xmlNodeSetValue ( plhouse, ""..tostring(getElementData ( source, "house" )).."")
		local plicq = xmlFindChild ( xmlPlayers, "icq", 0 )
		xmlNodeSetValue ( plicq, ""..tostring(getElementData ( source, "icq" )).."")
		local plemail = xmlFindChild ( xmlPlayers, "e-mail", 0 )
		xmlNodeSetValue ( plemail, ""..tostring(getElementData ( source, "email" )).."" )
		local plintel = xmlFindChild ( xmlPlayers, "intel", 0 )
		xmlNodeSetValue ( plintel, ""..tostring(getElementData ( source, "intel" )).."")
		local plluck = xmlFindChild ( xmlPlayers, "luck", 0 )
		xmlNodeSetValue ( plluck, ""..tostring(getElementData ( source, "luck" )).."")
		local plvision = xmlFindChild ( xmlPlayers, "vision", 0 )
		xmlNodeSetValue ( plvision, ""..tostring(getElementData ( source, "vision" )).."")
		local plhealth = xmlFindChild ( xmlPlayers, "health", 0 )
		xmlNodeSetValue ( plhealth, ""..tostring(getElementData ( source, "health" )).."")
		local plhouserent = xmlFindChild ( xmlPlayers, "houserent", 0 )
		xmlNodeSetValue ( plhouserent, ""..tostring(getElementData ( source, "houserent" )).."")
		local plweap1 = xmlFindChild ( xmlPlayers, "weap1", 0 )
			xmlNodeSetValue ( plweap1, ""..tostring(getPedWeapon ( source, 1 )).."")
			local plweap2 = xmlFindChild ( xmlPlayers, "weap2", 0 )
			xmlNodeSetValue ( plweap2, ""..tostring(getPedWeapon ( source, 2 )).."")
			local plweap3 = xmlFindChild ( xmlPlayers, "weap3", 0 )
			xmlNodeSetValue ( plweap3, ""..tostring(getPedWeapon ( source, 3 )).."")
			local plweap4 = xmlFindChild ( xmlPlayers, "weap4", 0 )
			xmlNodeSetValue ( plweap4, ""..tostring(getPedWeapon ( source, 4 )).."")
			local plweap5 = xmlFindChild ( xmlPlayers, "weap5", 0 )
			xmlNodeSetValue ( plweap5, ""..tostring(getPedWeapon ( source, 5 )).."")
			local plweap6 = xmlFindChild ( xmlPlayers, "weap6", 0 )
			xmlNodeSetValue ( plweap6, ""..tostring(getPedWeapon ( source, 6 )).."")
			local plweap7 = xmlFindChild ( xmlPlayers, "weap7", 0 )
			xmlNodeSetValue ( plweap7, ""..tostring(getPedWeapon ( source, 7 )).."")
			local plweap8 = xmlFindChild ( xmlPlayers, "weap8", 0 )
			xmlNodeSetValue ( plweap8, ""..tostring(getPedWeapon ( source, 8 )).."")
			local plweap9 = xmlFindChild ( xmlPlayers, "weap9", 0 )
			xmlNodeSetValue ( plweap9, ""..tostring(getPedWeapon ( source, 9 )).."")
			local plweap10 = xmlFindChild ( xmlPlayers, "weap10", 0 )
			xmlNodeSetValue ( plweap10, ""..tostring(getPedWeapon ( source, 10 )).."")
			local plammo1 = xmlFindChild ( xmlPlayers, "ammo1", 0 )
			xmlNodeSetValue ( plammo1, ""..tostring(getPedTotalAmmo ( source, 1 )).."")
			local plammo2 = xmlFindChild ( xmlPlayers, "ammo2", 0 )
			xmlNodeSetValue ( plammo2, ""..tostring(getPedTotalAmmo ( source, 2 )).."")
			local plammo3 = xmlFindChild ( xmlPlayers, "ammo3", 0 )
			xmlNodeSetValue ( plammo3, ""..tostring(getPedTotalAmmo ( source, 3 )).."")
			local plammo4 = xmlFindChild ( xmlPlayers, "ammo4", 0 )
			xmlNodeSetValue ( plammo4, ""..tostring(getPedTotalAmmo ( source, 4 )).."")
			local plammo5 = xmlFindChild ( xmlPlayers, "ammo5", 0 )
			xmlNodeSetValue ( plammo5, ""..tostring(getPedTotalAmmo ( source, 5 )).."")
			local plammo6 = xmlFindChild ( xmlPlayers, "ammo6", 0 )
			xmlNodeSetValue ( plammo6, ""..tostring(getPedTotalAmmo ( source, 6 )).."")
			local plammo7 = xmlFindChild ( xmlPlayers, "ammo7", 0 )
			xmlNodeSetValue ( plammo7, ""..tostring(getPedTotalAmmo ( source, 7 )).."")
			local plammo8 = xmlFindChild ( xmlPlayers, "ammo8", 0 )
			xmlNodeSetValue ( plammo8, ""..tostring(getPedTotalAmmo ( source, 8 )).."")
			local plammo9 = xmlFindChild ( xmlPlayers, "ammo9", 0 )
			xmlNodeSetValue ( plammo9, ""..tostring(getPedTotalAmmo ( source, 9 )).."")
			local plammo10 = xmlFindChild ( xmlPlayers, "ammo10", 0 )
			xmlNodeSetValue ( plammo10, ""..tostring(getPedTotalAmmo ( source, 10 )).."")
		xmlSaveFile(xmlPlayers)
	end
end

function preLoadPlayerAccountS ( )
--	triggerClientEvent ( "remotePlayerJoined", source )
--	if gettok ( getPlayerName ( source ), 1,string.byte('_') ) then
		if(xmlLoadFile ( ":players/Accounts/"..tostring(getPlayerName(source))..".xml" ) ) then
			outputChatBox ( "Данный аккаунт уже зарегистрирован! Введите свой пароль",source )
			triggerClientEvent ( source, "showLoginPlayerS", getRootElement() )
		else
			outputChatBox ( "Данный аккаунт не зарегистрирован! Нажмите на кнопку Registration",source )
			triggerClientEvent ( source, "showRegisterPlayerS", getRootElement() )
		end
		showPlayerHudComponent ( source, "radar", false )
		toggleControl ( source, "chatbox", false )
--	else
--		kickPlayer ( source, "Change nick-name to RP" )
--	end
--	toggleAllControls ( source, true, false, true, false )
end

addEvent("preLoadPlayerAccountC",true)
addEventHandler("preLoadPlayerAccountC",root,preLoadPlayerAccountS)

function spaceEvents ( source )
	local x, y, z = getElementPosition ( source )
	local dim = getElementDimension ( source )
	local entsucces = 0
	if(exports.sweetyRP:playerToPoint(source, 3, 221.5,185.1396,1003.0312)) then
    	if ( getElementData ( source, "facttype" ) == 1 ) then
    		triggerClientEvent ( source, "showEquip", source )
    	end
    end
    if exports.sweetyRP:playerToPoint(source, 3, 351.3447265625,212.03125,1008.3828125) then
    	if ( getElementData ( source, "facttype" ) == 4 ) then
         	if ( tonumber(getElementData ( source, "rank" )) < 3) then
    			triggerClientEvent ( source, "showMayorEquip", source)
			end
    	end
    end
    if(exports.sweetyRP:playerToPoint(source, 3, 358.267578125,169.15234375,1008.3828125)) then
    	if ( tonumber(getElementData ( source, "passport" ) ) ~= 1 ) then
        	outputChatBox ( "Секретарь: Это ведь вы нам звонили? Вот ваш пасспорт",  source, 255,204,0 )
			setElementData ( source, "passport", 1 )
			sendActionMessage( source, x, y, z, 6, "берет пасспорт" )
     	else
     	    outputChatBox ( "Секретарь: Да, что вам?", source, 255,204,0 )
		end
    end
--    if playerToPoint ( source, 30, 6.0780,-28.6330,1003.5490 ) then
--    	triggerClientEvent ( source, "workAcceptWindow", getRootElement(), 1 )
--    end
    if exports.sweetyRP:playerToPoint ( source, 3, 2097.00390625,2745.3115234375,10.8203125 ) then
    	triggerClientEvent ( source, "showBankSystem", source, getElementData ( source, "bmoney" ) )
    end
    if exports.sweetyRP:playerToPoint ( source, 3, 1174.314453125,1351.1201171875,10.921875 ) then
    	exports.sweetyRP:playerNearPDD ( source )
    end
	exports.busineses:toBuisnes ( dim, source )
	exports.buildings:toBuilding ( source )
    exports.houses:toHouse ( dim, source )
    exports.jobs:toWork ( source )
end

function entSucces ( source )
	if getElementData ( source, "mefind" ) > 0 then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if(getElementData ( source,"mefind") == getElementData ( player, "playerid" )) then
				outputChatBox("Спутник: Обьект зашел в здание, поиск окончен",player)
				setElementData(source,"mefind", 0)
				exports.factions:clearFindPlayers(source)
				setElementData(player,"find", 0)
			end
		end
	end
end

function openBarriers ( source )
	if(exports.sweetyRP:playerToPoint(source, 5, 2238.2, 2450.4064, 10.6131)) then
    	if ( getElementData ( source, "facttype" ) == 1 ) then
        	setObjectRotation ( copbarrier, 0, 5, 90 )
         	setTimer ( closeBarriers, 10000, 1, 1 )
    	end
    end
end

function closeBarriers ( barriernum )
	if ( barriernum == 1 ) then
       	setObjectRotation ( copbarrier, 0, 90, 90 )
    end
end