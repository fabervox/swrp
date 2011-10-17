function taxiStartDuty ( source, cmd, price )
	if tonumber(getElementData ( source, "work" )) == 1 then
		if getElementData ( source, "taxiduty" ) == nil then
			outputChatBox ("Информация: Вы вышли на дежурство!",source, 0,153,51 )
			setElementData ( source, "taxiduty", price )	
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if ( exports.sweetyRP:playerToPoint ( player, points, x, y, z ) ) then outputChatBox ( " Таксист " .. getPlayerName(source) .. " вышел на дежурство, телефон: ".. tostring(getElementData(source,"phone"))..", стоимость поездки: " .. tostring(price) .. "$ ", player, r,g,b ) end
			end	
		else
			outputChatBox ("Информация: Вы ушли с дежурства",source, 0,153,51 )	
			setElementData ( source, "taxiduty", nil )
		end
	end
end

addCommandHandler ("starttaxi", taxiStartDuty )
