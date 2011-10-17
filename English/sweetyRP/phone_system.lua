calltimer={}

function StartCall( source, cmd, nomer )
	if tonumber(getElementData ( source, "phone" )) > 0 then
		for id, player in ipairs ( getElementsByType ( "player" ) ) do
			if getElementData ( source, "phone" ) == nomer then
			--	if getElementData ( source, "phoneturn" ) == 1 then
					outputChatBox (" (Телефон) Звонок прошел, ждите", source, 204,204,255 )
					outputChatBox (" Вам звонит абонент "..tostring(getElementData ( source, "phone" ))..". Что бы взять трубку - введите /acall ", player, 204,204,255 )
					if ( playerToPoint ( player, 5, x, y, z ) ) then outputChatBox ( " У кого то звонит телефон ", player, 51,204,255 ) end
					calltimer[tonumber(getElementData ( source, "phone" ))] = setTimer ( breakCall, 10000, 1, source, player )
					setElementData ( source, "call", getElementData ( player, "playerid" ) )
					setElementData ( player, "call", getElementData ( source, "playerid" ) )
			--	else
					outputChatBox (" (Телефон) Аппарат абонента выключен", source, 204,204,255 )
			--	end
			else
				outputChatBox (" (Телефон) Неправильно набран номер", source, 204,204,255 )
			end
		end
	end
end

addCommandHandler ("call", StartCall)

function AcceptCall ( source )
	outputChatBox ("Информация: Вы подняли трубку",source, 0,153,51 )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if getElementData ( source, "call" ) == getElementData ( player, "playerid" ) then
			if getElementData ( player, "call" ) == getElementData ( source, "playerid" ) then
				setElementData ( source, "ocall", getElementData ( source, "playerid" ) )
				setElementData ( player, "ocall", getElementData ( player, "playerid" ) )
				outputChatBox (" (Телефон) Вам ответили, говорите", player, 204,204,255 )
				killTimer ( calltimer[tonumber(getElementData ( source, "phone" ))] )
			end
		end
	end
end
addCommandHandler ("acall", AcceptCall)

function breakCall ( source, player )
	outputChatBox (" (Телефон) Абонент не отвечает", source, 204,204,255 )
	outputChatBox (" (Телефон) Звонок сбошен", player, 204,204,255 )
	setElementData ( source, "call", "0" )
	setElementData ( player, "call", "0" )
	giveBizMoney( 12, callprice, 1 )
	setElementData ( source, "pmoney", tonumber(getElementData ( source, "pmoney" )) - callprice )
	setElementData ( player, "pmoney", tonumber(getElementData ( player, "pmoney" )) - callprice )
end

function HangUpCall( source, cmd )
	setElementData ( source, "call", "0" )
	setElementData ( source, "ocall", "0" )
	outputChatBox (" (Телефон) Вы положили трубку", source, 204,204,255 )
	for id, player in ipairs ( getElementsByType ( "player" ) ) do
		if getElementData ( source, "ocall" ) == getElementData ( player, "playerid" ) then
			if getElementData ( player, "ocall" ) == getElementData ( source, "playerid" ) then
			setElementData ( player, "call", "0" )
			setElementData ( player, "ocall", "0" )
			outputChatBox (" (Телефон) Ваш собеседник положил трубку", player, 204,204,255 )
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
					    	outputChatBox ("СМС от " .. getPlayerName(player) .. ": "..text.." ",player, 255,255,127 )
					    	local x,y,z = getElementPosition( source )
					    	sendActionMessage( source, x, y, z, 6, "пишет смс" )
					    	setElementData ( source, "pmoney", playerpmoney - smsprice )
					    	playeronline = 1
		                else
		                    outputChatBox ("Вас связали!",source, 255,255,127 )
						end
					end
				end
				if (playeronline == 0) then
					outputChatBox (" Этот игрок не в сети ",source, 255,255,127 )
				end
			else
				outputChatBox ("Невозможно отправить сообщение: не хватает денег на счету",source, 255,255,127 )
			end
		else
			outputChatBox ("Сначала купите телефон в 24/7",source, 255,255,127 )
		end
	else
		outputChatBox ("Правильно: /sms [номер телефона] текст ", 255,255,127 )
	end
end

addCommandHandler ("sms", smsChat)