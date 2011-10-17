function isLoggedIn( player )
	return getElementData(player,"logged") and true or false
end

addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
		setTimer( spawnPlayer, 2000, 1, source, 1606,1817,11, 0, getElementData ( source, "skin" ) )
		outputChatBox ("Информация: Вас вырубили, стоимость лечения: 200$",source, 0,153,51 )
		exports.factions:giveFactionMoney(6,100)
		takePlayerMoney ( source, 200 )
		--saveFactions ()
	end
)

function showPlayerInfos ( source, cmd )
	local playercar = exports.cars:getVehicleByOwner(getElementData ( source, "playerid" ))
	local playerhouse = getElementData ( source, "house" )
	local playerbiz = exports.busineses:getBizByOwner(getElementData ( source, "playerid" ))
	if playerhouse == 0 then
		local housex, housey, housez = 0
	else
		local playerfinalhouse = exports.houses:getHouse(playerhouse)
		local housex, housey, housez = getElementPosition ( playerfinalhouse )
	end
	if getElementData ( source, "faction" ) > 0 then
		factionmoney = exports.factions:getFactionInfo(getElementData ( source, "faction" ), 18 ) 
	else
		factionmoney = 0
	end
	triggerClientEvent ( source, "showPlayerInfos", source, playercar, playerhouse, playerbiz, housex, housey, housez, factionmoney)
end
		
addCommandHandler ("infos", showPlayerInfos)

function changeFactionMoney ( money )
	exports.factions:setFactionInfo(getElementData ( source, "faction" ), 18, money ) 
end
		
addEvent( "changeFactionMoneyC", true )
addEventHandler( "changeFactionMoneyC", getRootElement(), changeFactionMoney )

function savePlayersAccounts ()
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		saveAccount ( player )
	end
end

function giveWeaponFromPlayer( source, commandName, ident, ammo )
	local playeronline = 0
	if(ident) then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( getElementData ( player, "playerid" ) ==  tonumber(ident) ) then
				if exports.sweetyRP:playerToPoint ( source, 3, getElementPosition ( player ) ) then
	                local playerweap = getPedWeapon ( source )
	                local playerammo = getPedTotalAmmo ( source )
	                if ammo then
	                    if tonumber(ammo) <= playerammo then
	                    	playerammo = tonumber(ammo)
						else
						    outputChatBox ("Ошибка: у вас нет столько патронов ",source, 255,255,127 )
							return true
						end
					end
					exports.sweetyRP:sendClientActionMessage(source, 11 )
	                giveWeapon ( player, playerweap , playerammo, true )
	                takeWeapon ( source, playerweap )
	                local givedweapon = getWeaponNameFromID ( playerweap )
	                outputChatBox ("Информация: "..getPlayerName ( source ).." передал вам оружие "..givedweapon.."",player, 0,153,51 )
	                outputChatBox ("Информация: Вы передали оружие "..givedweapon.." игроку "..getPlayerName ( source ).."",source, 0,153,51 )
	            else
	            	outputChatBox ("Вы далеко друг от друга",source, 255,255,127 )
	            end
	       	    playeronline = 1
			end
		end
		if (playeronline == 0) then
			outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
		end
	else
    	outputChatBox ("Правильно: /giveweap ид игрока (количество патрон)", source,255,255,127 )
    end
end

addCommandHandler ("giveweap", giveWeaponFromPlayer)