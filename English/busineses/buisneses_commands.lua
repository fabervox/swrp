function adminCreateBusiness ( source, cmd, type, price, value2 )
	if(tonumber(getElementData(source,"admlvl")) > 2) then
		if(type) then
			if(price) then
			  if(value2) then
			  	  local root = xmlLoadFile ("busineses.xml")
			  	  local houseroot = xmlFindChild (root,"home",0)
			      local createdhouse = xmlCreateChild ( houseroot, "house" )
				  local x, y, z = getElementPosition ( source )
				  maxbiz = maxbiz+1
			      xmlNodeSetAttribute ( createdhouse, "price", price )
			      xmlNodeSetAttribute ( createdhouse, "ownerid", "0" )
			      xmlNodeSetAttribute ( createdhouse, "name", "Nobody" )
				  xmlNodeSetAttribute ( createdhouse, "x", x )
				  xmlNodeSetAttribute ( createdhouse, "y", y )
				  xmlNodeSetAttribute ( createdhouse, "z", z )
			      xmlNodeSetAttribute ( createdhouse, "dim", maxbiz )
			      xmlNodeSetAttribute ( createdhouse, "int", "0" )
				  xmlNodeSetAttribute ( createdhouse, "value1", "0" )
				  xmlNodeSetAttribute ( createdhouse, "value2", value2 )
				  xmlNodeSetAttribute ( createdhouse, "value3", "0" )
			      xmlNodeSetAttribute ( createdhouse, "value4", "0" )
				  xmlNodeSetAttribute ( createdhouse, "value5", "0" )
				  xmlNodeSetAttribute ( createdhouse, "opt1", "0" )
				  xmlNodeSetAttribute ( createdhouse, "opt2", "0" )
				  xmlNodeSetAttribute ( createdhouse, "opt3", "0" )
				  xmlNodeSetAttribute ( createdhouse, "lock", "0" )
				  xmlNodeSetAttribute ( createdhouse, "products", "0" )
				  xmlNodeSetAttribute ( createdhouse, "type", type )
				  createNewBiz ( x, y, z )
			      setElementData ( bizpickup[maxbiz], "owner", "0" )
			      setElementData ( getBiz(getMaxBiz()), "price", price )
			      setElementData ( getBiz(getMaxBiz()), "name", "Nobody" )
			      setElementData ( getBiz(getMaxBiz()), "int", "0" )
			      setElementData ( getBiz(getMaxBiz()), "dim", maxbiz )
			      setElementData ( getBiz(getMaxBiz()), "value1", "0" )
			      setElementData ( getBiz(getMaxBiz()), "value2", "0" )
			      setElementData ( getBiz(getMaxBiz()), "value3", "0" )
			      setElementData ( getBiz(getMaxBiz()), "value4", "0" )
			      setElementData ( getBiz(getMaxBiz()), "value5", "0" )
			      setElementData ( getBiz(getMaxBiz()), "opt1", "0" )
			      setElementData ( getBiz(getMaxBiz()), "opt2", "0" )
			      setElementData ( getBiz(getMaxBiz()), "opt3", "0" )
			      setElementData ( getBiz(getMaxBiz()), "lock", "0" )
			      setElementData ( getBiz(getMaxBiz()), "products", products )
			      setElementData ( getBiz(getMaxBiz()), "type", type )
			      xmlSaveFile(root)
			      outputChatBox ("Создан бизнес с номером "..tostring(getMaxBiz()).."",source, 255,255,127 )
			    end
		    end
		end
	else
		outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
	end
end

addCommandHandler ("abizcreate", adminCreateBusiness)

function adminSetBusinesOpt ( source, cmd, num )
	if(tonumber(getElementData(source,"admlvl")) > 2) then
		  local x, y, z = getElementPosition ( source )
		  local bizid = tonumber(num)
		  setElementData ( getBiz(bizid), "opt1", x )
	      setElementData ( getBiz(bizid), "opt2", y )
	      setElementData ( getBiz(bizid), "opt3", z )
	      saveBusineses ()
	else
		outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
	end
end

addCommandHandler ("abizopt", adminSetBusinesOpt)

function adminSetBizPrice ( source, cmd, housenum, houseprice )
	if(housenum) then
		if(houseprice) then
			if(tonumber(getElementData(source,"admlvl")) > 2) then
        		for i,v in ipairs (bizpickup) do
        			local dosucces = 0
          		    if(getElementData(getBiz(i), "dim") == housenum) then
          		    	setElementData ( getBiz(i), "price", houseprice )
              			outputChatBox ("Вы установили бизнесу "..tostring(housenum).." цену "..tostring(houseprice).." долларов!",source, 243,149,72 )
              			dosucces = 1
              			saveBusineses ()
					end
					if(dosucces == 0) then
					    outputChatBox ("Ошибка: такого бизнеса нету",source, 255,255,127 )
					end
        		end
			else
				outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
			end
		else
			outputChatBox ("Правильно: /abizprice [номер бизнеса] цена бизнеса",source, 255,255,127 )
		end
    else
		outputChatBox ("Правильно: /abizprice [номер бизнеса] цена бизнеса",source, 255,255,127 )
	end
end

addCommandHandler ("abizprice", adminSetBizPrice)

function adminSetBizType ( source, cmd, housenum, houseint )
	if(housenum) then
		if(houseint) then
			if(tonumber(getElementData(source,"admlvl")) > 2) then
        		for i,v in ipairs (bizpickup) do
        			local dosucces = 0
        		    if(getElementData(getBiz(i), "dim") == housenum) then
        		    	setElementData ( getBiz(i), "type", houseint )
              			outputChatBox ("Вы установили бизнесу "..tostring(housenum).." тип "..tostring(houseint).."!",source, 243,149,72 )
              			dosucces = 1
              			saveBusineses ()
					end
					if(dosucces == 0) then
					    outputChatBox ("Ошибка: такого бизнеса нету",source, 255,255,127 )
					end
        		end
			else
				outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
			end
		else
			outputChatBox ("Правильно: /abiztype [номер бизнеса] тип",source, 255,255,127 )
		end
    else
		outputChatBox ("Правильно: /abiztype [номер бизнеса] тип",source, 255,255,127 )
	end
end

addCommandHandler ("abiztype", adminSetBizType )

function adminSellBiz ( source, cmd, housenum )
	if(housenum) then
			if(tonumber(getElementData(source,"admlvl")) > 2) then
        		for i,v in ipairs (housepickup) do
        			local dosucces = 0
        		    if(getElementData(getBiz(i), "dim") == housenum) then
        		        setElementData ( getBiz(i), "ownid", "0" )
					 	setElementData ( getBiz(i), "name", "Nobody" )
              			outputChatBox ("Вы продали бизнес "..tostring(housenum).."!",source, 243,149,72 )
              			dosucces = 1
              			saveBusineses ()
					end
					if(dosucces == 0) then
					    outputChatBox ("Ошибка: такого бизнеса нету",source, 255,255,127 )
					end
        		end
			else
				outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
			end
    else
		outputChatBox ("Правильно: /abizsell [номер бизнеса]",source, 255,255,127 )
	end
end

addCommandHandler ("abizsell", adminSellBiz )

function PlayerSellBiz ( source, cmd )
	local sellsucces = 0
	for i,v in ipairs (bizpickup) do
		local hx, hy, hz = getElementPosition ( getBiz(i) )
		if(playerToPoint(source, 3, hx, hy, hz)) then
		    if getElementData ( source, "playerid" ) == getElementData ( getBiz(i), "owner" ) then
		        if tonumber(getElementData ( getBiz(i), "type" )) == 1 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Телекомпания. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Телекомпания. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 3 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Магазин одежды. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Магазин одежды. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 5 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Фастфуд. Не продается", source, 255,204,0 )
					else
						outputChatBox ( "Фастфуд. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 7 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Магазин 24/7. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Магазин 24/7. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 8 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Магазин оружия. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Магазин оружия. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 6 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Автозаправка. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Автозаправка. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 9 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Автобусная станция. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Автобусная станция. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 10 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Чистка улиц. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Чистка улиц. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
				if tonumber(getElementData ( getBiz(i), "type" )) == 12 then
					if tonumber(getElementData ( getBiz(i), "ownid" )) > 0 then
						outputChatBox ( "Автозавод. Не продается", source,  255,204,0 )
					else
						outputChatBox ( "Автозавод. Продается. Цена: "..tostring(getElementData ( getBiz(i), "price" )).."$", source,  255,204,0 )
					end
				end
  			end
  		end
	end
	if sellsucces == 1 then
		outputChatBox ("Ошибка: вы не рядом с бизнесом",source, 255,255,127 )
	end
end

addCommandHandler ("bizsell", PlayerSellBiz )

function showBizInfo ( source, cmd )
	local sellsucces = 0
	for i,v in ipairs (bizpickup) do
		local hx, hy, hz = getElementPosition ( getBiz(i) )
		if(playerToPoint(source, 3, hx, hy, hz)) then
		    if getElementData ( source, "playerid" ) == getElementData ( getBiz(i), "owner" ) then
		        setElementData ( getBiz(i), "ownid", "0" )
			 	setElementData ( getBiz(i), "name", "Nobody" )
	  			outputChatBox ("Вы продали свой бизнес!",source, 243,149,72 )
	  			saveHouses ()
	  			saveBusineses = 1
	  			givePlayerMoney ( source, getElementPrice ( getBiz(i), "price" ) )
  			end
  		end
	end
end

addCommandHandler ("bizinfo", showBizInfo )
