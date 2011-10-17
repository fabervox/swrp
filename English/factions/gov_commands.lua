function SetTax( source, commandName, taxes )
	if(taxes) then
		if ( getFactionInfo ( getElementData ( source, "faction" ), 17 ) == 4 ) then
			if ( tonumber(getElementData ( source, "rank" )) == 5) then
				outputChatBox ("Вы установили налог на "..tostring(taxes).." долларов ",source, 72,193,243 )
			    local x,y,z = getElementPosition( source )
				outputChatBox ("Внимание! Губернатор "..getPlayerName(source).." установил налог на "..tostring(taxes).." долларов!", 243,149,72 )
				local xmlTaxFile = xmlLoadFile ( "ServerProp.xml" )
				local tax1 = xmlFindChild (xmlTaxFile, "tax", 0 )
				xmlNodeSetValue ( tax1, ""..tostring(taxes).."" )
				xmlSaveFile ( xmlTaxFile )
			else
				outputChatBox ("У вас нету права устанавливать налоги!",source, 72,193,243 )
			end
		else
			outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
		end
    else
		outputChatBox ("Правильно: /settax налог в долларах",source, 255,255,127 )
	end
end

addCommandHandler ("settax", SetTax)