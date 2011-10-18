calltimer={}

function StartCall( source, cmd, nomer )
	if tonumber(getElementData ( source, "phone" )) > 0 then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if getElementData ( source, "phone" ) == nomer then
			--	if getElementData ( source, "phoneturn" ) == 1 then
					outputChatBox ("(Phone) You are connected, wait", source, 204,204,255 )
					outputChatBox ("Incoming call from "..tostring(getElementData ( source, "phone" ))..". Type /acall to answer ", player, 204,204,255 )
					if ( playerToPoint ( player, 5, x, y, z ) ) then outputChatBox ( "Somebody's phone is ringing", player, 51,204,255 ) end
					calltimer[tonumber(getElementData ( source, "phone" ))] = setTimer ( breakCall, 10000, 1, source, player )
					setElementData ( source, "call", getElementData ( player, "playerid" ) )
					setElementData ( player, "call", getElementData ( source, "playerid" ) )
			--	else
					outputChatBox ("(Phone) The phone is turned off", source, 204,204,255 )
			--	end
			else
				outputChatBox (" (Phone) Wrong telephone number", source, 204,204,255 )
			end
		end
	end
end

addCommandHandler ("call", StartCall)

function AcceptCall ( source )
	outputChatBox ("Info: You answered the call",source, 0,153,51 )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if getElementData ( source, "call" ) == getElementData ( player, "playerid" ) then
			if getElementData ( player, "call" ) == getElementData ( source, "playerid" ) then
				setElementData ( source, "ocall", getElementData ( source, "playerid" ) )
				setElementData ( player, "ocall", getElementData ( player, "playerid" ) )
				outputChatBox ("(Phone) Your call is answered, speak", player, 204,204,255 )
				killTimer ( calltimer[tonumber(getElementData ( source, "phone" ))] )
			end
		end
	end
end
addCommandHandler ("acall", AcceptCall)

function breakCall ( source, player )
	outputChatBox ("(Phone) No answer", source, 204,204,255 )
	outputChatBox ("(Phone) The call was rejected", player, 204,204,255 )
	setElementData ( source, "call", "0" )
	setElementData ( player, "call", "0" )
	giveBizMoney( 12, callprice, 1 )
	setElementData ( source, "pmoney", tonumber(getElementData ( source, "pmoney" )) - callprice )
	setElementData ( player, "pmoney", tonumber(getElementData ( player, "pmoney" )) - callprice )
end

function HangUpCall( source, cmd )
	setElementData ( source, "call", "0" )
	setElementData ( source, "ocall", "0" )
	outputChatBox ("(Phone) You rejected the call", source, 204,204,255 )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if getElementData ( source, "ocall" ) == getElementData ( player, "playerid" ) then
			if getElementData ( player, "ocall" ) == getElementData ( source, "playerid" ) then
			setElementData ( player, "call", "0" )
			setElementData ( player, "ocall", "0" )
			outputChatBox ("(Phone) Your interlocutor rejected the call", player, 204,204,255 )
			end
		end
	end
end

addCommandHandler ("hangup", HangUpCall)

function smsChat( source, commandName, ident, ... )
	local parametersTable = {...}
   	local text = table.concat(parametersTable, " ")
	if (text) then
	local playerpmoney = tonumber(getElementData ( player, "pmoney" ))
	local playerphone = tonumber(getElementData ( player, "phone" ))
	local playeronline = 0
		if playerphone > 0 then
			if playerpmoney > 0 then
				for id, player in ipairs ( getElementsByType ( "player" ) ) do
					if ( tonumber(getElementData ( player, "phone" )) ==  tonumber(ident) ) then
						if(getElementData ( source, "tied" ) ~= 1) then
					    	outputChatBox ("SMS from " .. getPlayerName(player) .. ": "..text.." ",player, 255,255,127 )
					    	local x,y,z = getElementPosition( source )
					    	sendActionMessage( source, x, y, z, 6, "is writing an SMS" )
					    	setElementData ( source, "pmoney", playerpmoney - smsprice )
					    	playeronline = 1
		                else
		                    outputChatBox ("You are tied!",source, 255,255,127 )
						end
					end
				end
				if (playeronline == 0) then
					outputChatBox ("This player is offline",source, 255,255,127 )
				end
			else
				outputChatBox ("Impossible to send the message: haven't enough money",source, 255,255,127 )
			end
		else
			outputChatBox ("Buy yourself a phone first (at one of the 24/7 stores)",source, 255,255,127 )
		end
	else
		outputChatBox ("Correct: /sms [phone number] text", 255,255,127 )
	end
end

addCommandHandler ("sms", smsChat)