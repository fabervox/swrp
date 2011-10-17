function LocalChat( player, cmd, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
	    if(getElementData ( player, "clap" ) ~= 1) then
			local x,y,z = getElementPosition( player )
			sendMessageToPoint( player, x, y, z, 10, "shouted",230,230,230, text )
		else
		    sendMessageToPoint( player, x, y, z, 2.5, "said", 230,230,230, "mm-mm-mm" )
		end
	else
	  		outputChatBox ("Correct: /l(ocal) text ", 255,255,127 )
	end
end

addCommandHandler ("local", LocalChat)
addCommandHandler ("l", LocalChat)

function SayChat( ... )
    local parametersTable = {...}
	table.remove(parametersTable,#parametersTable)
    local text = table.concat(parametersTable, " ")
    local x,y,z = getElementPosition( source )
    for id, player in ipairs ( getElementsByType ( "player" ) ) do
        if(getElementData(source, "radioguest") == 1) then
    		outputChatBox ("LVR Guest "..getPlayerName(source)..": " .. tostring(text).."", 243,149,72 )
    		return true
		end
		if(getElementData(source, "radiodj") == 1) then
    		outputChatBox ("LVR "..getPlayerName(source)..": " .. tostring(text).."", 243,149,72 )
            return true
		end
		if( tonumber(getElementData ( source, "call" )) > 0) then
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if getElementData ( source, "ocall" ) == getElementData ( player, "playerid" ) then
					outputChatBox (" (Phone) "..getPlayerName(source)..": " .. tostring(text).."", player, 204,204,255 )
					return true
				end
			end
			if ( playerToPoint ( player, 5, x, y, z ) ) then outputChatBox ( " " .. getPlayerName(source) .. " said to the phone: " .. tostring(text) .. " ", player, r,g,b ) end
		end
		if(getElementData ( source, "clap" ) == 1) then
		    if ( playerToPoint ( player, 5, x, y, z ) ) then outputChatBox ( " " .. getPlayerName(source) .. " said: mm-mm-mm ", player, r,g,b ) end
            return true
		else
			if ( playerToPoint ( player, 5, x, y, z ) ) then outputChatBox ( " " .. getPlayerName(source) .. " said: " .. tostring(text) .. " ", player, r,g,b ) end
		end
	end
end

addEventHandler( "onPlayerChat", getRootElement(), SayChat )

function sendToPlayer( player, radius, x, y, z )
    if isElement( player ) and radius and x and y and z then
        return getDistanceBetweenPoints3D( x, y, z, getElementPosition( player ) ) <= radius
    end
    return false
end

function sendMessageToPoint( source, x, y, z, points, type, r,g,b, text )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if ( playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( " " .. getPlayerName(source) .. " ".. tostring(type) ..": " .. tostring(text) .. " ", player, r,g,b ) end
	end
end

function sendActionMessage( source, x, y, z, points, action )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if ( playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( " " .. getPlayerName(source) .. " "..action.." ", player,51,204,255 ) end
	end
end

function sendNonRPMessage( source, x, y, z, points, type, r,g,b, text )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if ( playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( " (( " .. getPlayerName(source) .. " ".. tostring(type) ..": " .. tostring(text) .. " )) ", player, r,g,b ) end
	end
end

function SendCopMessage( text )
	for id, factionpl in ipairs ( getElementsByType ( "player" ) ) do
        if ( getElementData ( factionpl, "duty" ) == 1 ) then
			if ( tonumber(factions[tonumber(getElementData ( factionpl, "faction" ))][17]) == 1 ) then
				outputChatBox ( text,factionpl, 0,102,204 )
			end
		end
	end
end

function MeChat( source, cmd, ... )
	local parametersTable = {...}
   	local action = table.concat(parametersTable, " ")
	if (action) then
		local x,y,z = getElementPosition( source )
  		sendActionMessage( source, x, y, z, 6, ""..tostring(action).."" )
	else
	  		outputChatBox ("Correct: /act action ", 255,255,127 )
	end
end

addCommandHandler ("act", MeChat)

function blockChatMessage()
    cancelEvent()
end
addEventHandler( "onPlayerChat", getRootElement(), blockChatMessage )

function LowChat( player, cmd, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
		local x,y,z = getElementPosition( player )
		if(getElementData ( source, "clap" ) ~= 1) then
			sendMessageToPoint( player, x, y, z, 2.5, "quietly said", 230,230,230, text )
		else
		    sendMessageToPoint( player, x, y, z, 2.5, "said", 230,230,230, "мм-мм-мм" )
		end
	else
	  		outputChatBox ("Correct: /low text ", 255,255,127 )
	end
end

addCommandHandler ("low", LowChat)

function WhisperChat( source, commandName, ident, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
	local playeronline = 0
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( getElementData ( player, "playerid" ) ==  tonumber(ident) ) then
				if(getElementData ( source, "clap" ) ~= 1) then
			    	outputChatBox ("" .. getPlayerName(player) .. " is whispering: "..text.." ",player, 255,255,127 )
			    	local x,y,z = getElementPosition( source )
			    	sendActionMessage( source, x, y, z, 6, "is whispering something" )
			    	playeronline = 1
                else
                    outputChatBox ("You are muted!",source, 255,255,127 )
				end
			end
		end
		if (playeronline == 0) then
			outputChatBox ("This player is offline!",source, 255,255,127 )
		end
	else
		outputChatBox ("Correct: /w [player id] text ", 255,255,127 )
	end
end

addCommandHandler ("w", WhisperChat)

function NonRPChat( player, cmd, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
		local x,y,z = getElementPosition( player )
		sendNonRPMessage( player, x, y, z, 7, "сказал",175,175,175, text )
	else
	  		outputChatBox ("Правильно: /b текст ", 255,255,127 )
	end
end

addCommandHandler ("b", NonRPChat)

function OOChat( player, cmd, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
		local x,y,z = getElementPosition( player )
		sendNonRPMessage( player, x, y, z, 5000, "said",51,204,255, text )
	else
	  	outputChatBox ("Correct: /o(oc) text ", 255,255,127 )
	end
end

addCommandHandler ("o", OOChat)
addCommandHandler ("ooc", OOChat)

function DoChat( source, cmd, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
		local x,y,z = getElementPosition( source )
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if ( playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( ""..text.." (( " .. getPlayerName(source) .. " ))", player,51,204,255 ) end
		end
	else
	  		outputChatBox ("Correct: /do action ", 255,255,127 )
	end
end

addCommandHandler ("do", DoChat)

function TryDoing( playerd, cmd, ... )
	local parametersTable = {...}
   	local trydo = table.concat(parametersTable, " ")
	if (trydo) then
		if(getElementData ( playerd, "trydo" ) ==  0) then
			doing = math.random(0,100)
			local x,y,z = getElementPosition( playerd )
			if (doing > 51) then
				for id, player in ipairs ( getElementsByType ( "player" ) ) do
					if ( playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( " " .. getPlayerName(playerd) .. " tried  " .. tostring(trydo) .. ", and succeeded with that. ", player, 51,204,255 ) end
				end
			else if (doing < 52) then
				for id, player in ipairs ( getElementsByType ( "player" ) ) do
					if ( playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( " " .. getPlayerName(playerd) .. " tried  " .. tostring(trydo) .. ", but didn't succeed with that. ", player, 51,204,255 ) end
				end
			end
			setElementData ( playerd, "trydo", 1 )
			setTimer ( tryDoTime, 60000, 1, playerd )
		end
	    else
           	outputChatBox ("Info: /try is possible to use once a minute only!",source, 240,240,240 )
        end
	else
	  		outputChatBox ("Correct: /try action",source, 255,255,127 )
	end
end

addCommandHandler ("try", TryDoing)

function tryDoTime ( thePlayer )
	setElementData ( source, "trydo", 0 )
end

addEvent("sendToCopMessage",true)
addEventHandler("sendToCopMessage",root,SendCopMessage)