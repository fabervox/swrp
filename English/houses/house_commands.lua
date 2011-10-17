--------------------------[Система домов]--------------------------------------
function adminCreateHouse ( source, cmd, interior, price )
	if(getElementData(source,"admlvl") > 2) then
		if(interior) then
			if(price) then
		  	  local root = xmlLoadFile ("houses.xml")
		  	  local houseroot = xmlFindChild (root,"home",0)
		      local createdhouse = xmlCreateChild ( houseroot, "house" )
			  local x, y, z = getElementPosition ( source )
			  setMaxHouses(getMaxHouses()+1)
		      xmlNodeSetAttribute ( createdhouse, "price", price )
		      xmlNodeSetAttribute ( createdhouse, "ownerid", "0" )
		      xmlNodeSetAttribute ( createdhouse, "name", "Nobody" )
			  xmlNodeSetAttribute ( createdhouse, "x", x )
			  xmlNodeSetAttribute ( createdhouse, "y", y )
			  xmlNodeSetAttribute ( createdhouse, "z", z )
		      xmlNodeSetAttribute ( createdhouse, "dim", getMaxHouses() )
		      xmlNodeSetAttribute ( createdhouse, "int", interior )
			  xmlNodeSetAttribute ( createdhouse, "rent", "0" )
			  xmlNodeSetAttribute ( createdhouse, "lock", "0" )
			  xmlNodeSetAttribute ( createdhouse, "rentprice", "0" )
			  xmlNodeSetAttribute ( createdhouse, "moneys", "0" )
			  xmlNodeSetAttribute ( createdhouse, "renters", "0" )
		      createNewHouse ( x, y, z )
			  setElementData ( getHouse(getMaxHouses()), "price", price )
			  setElementData ( getHouse(getMaxHouses()), "owner", "0" )
			  setElementData ( getHouse(getMaxHouses()), "name", "Nobody" )
			  setElementData ( getHouse(getMaxHouses()), "dim", maxhouses )
			  setElementData ( getHouse(getMaxHouses()), "int", interior )
			  setElementData ( getHouse(getMaxHouses()), "rent", "0" )
			  setElementData ( getHouse(getMaxHouses()), "lock", "0" )
			  setElementData ( getHouse(getMaxHouses()), "rentprice", "0" )
			  setElementData ( getHouse(getMaxHouses()), "moneys", "0" )
			  setElementData ( getHouse(getMaxHouses()), "renters", "0" )
		      xmlSaveFile(root)
		    end
		end
	else
		outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
	end
end

addCommandHandler ("ahousecreate", adminCreateHouse)
addCommandHandler ("ahousesave", saveHouses)

function adminSetHousePrice ( source, cmd, housenum, houseprice )
	if(housenum) then
		if(houseprice) then
			if(getElementData(source,"admlvl") > 2) then
        		for i,v in ipairs (getMaxHouses()) do
        			local dosucces = 0
          		    if(getElementData(getHouse(i), "dim") == housenum) then
          		    	setElementData ( housepickup[i], "price", houseprice )
              			outputChatBox ("Вы установили дому "..tostring(housenum).." цену "..tostring(houseprice).." долларов!",source, 243,149,72 )
              			dosucces = 1
              			saveHouses ()
					end
					if(dosucces == 0) then
					    outputChatBox ("Ошибка: такого дома нету",source, 255,255,127 )
					end
        		end
			else
				outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
			end
		else
			outputChatBox ("Правильно: /ahouseprice [номер дома] цена дома",source, 255,255,127 )
		end
    else
		outputChatBox ("Правильно: /ahouseprice [номер дома] цена дома",source, 255,255,127 )
	end
end

addCommandHandler ("ahouseprice", adminSetHousePrice)

function adminSetHouseInt ( source, cmd, housenum, houseint )
	if(housenum) then
		if(houseint) then
			if(tonumber(getElementData(source,"admlvl")) > 2) then
        		for i,v in ipairs (getMaxHouses()) do
        			local dosucces = 0
        		    if(getElementData(getHouse(i), "dim") == housenum) then
        		    	setElementData ( getHouse(i), "int", houseint )
              			outputChatBox ("Вы установили дому "..tostring(housenum).." интерьер "..tostring(houseint).."!",source, 243,149,72 )
              			dosucces = 1
              			saveHouses ()
					end
					if(dosucces == 0) then
					    outputChatBox ("Ошибка: такого дома нету",source, 255,255,127 )
					end
        		end
			else
				outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
			end
		else
			outputChatBox ("Правильно: /ahouseint [номер дома] интерьер",source, 255,255,127 )
		end
    else
		outputChatBox ("Правильно: /ahouseint [номер дома] интерьер",source, 255,255,127 )
	end
end

addCommandHandler ("ahouseint", adminSetHouseInt)

function adminSellHouse ( source, cmd, housenum )
	if(housenum) then
			if(tonumber(getElementData(source,"admlvl")) > 2) then
        		for i,v in ipairs (getMaxHouses()) do
        			local dosucces = 0
        		    if(getElementData(getHouse(i), "dim") == housenum) then
        		        setElementData ( getHouse(i), "owner", "0" )
					 	setElementData ( getHouse(i), "name", "Nobody" )
              			outputChatBox ("Вы продали дом "..tostring(housenum).."!",source, 243,149,72 )
              			dosucces = 1
              			saveHouses ()
					end
					if(dosucces == 0) then
					    outputChatBox ("Ошибка: такого дома нету",source, 255,255,127 )
					end
        		end
			else
				outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
			end
    else
		outputChatBox ("Правильно: /ahousesell [номер дома]",source, 255,255,127 )
	end
end

addCommandHandler ("ahousesell", adminSellHouse)

function PlayerSellHouse ( source, cmd)
local sellsucces = 0
	for i,v in ipairs (getMaxHouses()) do
		local hx, hy, hz = getElementPosition ( housepickup[i] )
		if(exports.sweetyRP:playerToPoint(source, 3, hx, hy, hz)) then
		    if getElementData ( source, "playerid" ) == getElementData ( getHouse(i), "owner" ) then
		        setElementData ( getHouse(i), "owner", "0" )
			 	setElementData ( getHouse(i), "name", "Nobody" )
      			outputChatBox ("Вы продали свой дом!",source, 243,149,72 )
      			saveHouses ()
      			sellsucces = 1
      			givePlayerMoney ( source, getElementData ( getHouse(i), "price" ) )
  			end
  		end
	end
	if sellsucces == 1 then
		outputChatBox ("Ошибка: вы не рядом со своим домом",source, 255,255,127 )
	end
end

addCommandHandler ("housesell", PlayerSellHouse)

function HouseOwnerFunction ( source, cmd, type, valve )
	if type ~= nil then
		for i,v in ipairs (housepickup) do
	    	local hx, hy, hz = getElementPosition ( getHouse(i) )
			if(exports.sweetyRP:playerToPoint(source, 3, hx, hy, hz)) then
				local owner = getElementData ( getHouse(i), "owner" )
				if owner == getElementData ( source, "playerid" ) then
					if(tonumber(type) == 1) then
						if tonumber(valve) > 0 and tonumber(valve) < 999 then
							setElementData ( getHouse(i), "rentprice", valve	)
							outputChatBox("Информация: Вы установили цену аренды комнаты в своем доме на "..tostring(valve).."$", source, 0,153,51)
							saveHouses()
						else
							outputChatBox("Ошибка: Цена аренды не может быть меньше 1$ и больше 999$!", source, 102, 0, 0)
						end

					end
					if(tonumber(type) == 2) then
						if tonumber(getElementData ( getHouse(i), "rent" )) == 0 then
							setElementData ( getHouse(i), "rent", "1" )
							outputChatBox("Информация: Теперь другие игроки могут арендовать комнату в вашем доме", source, 0,153,51)
						else
							setElementData ( getHouse(i), "rent", "0" )
							outputChatBox("Информация: Теперь другие игроки могут арендовать комнату в вашем доме", source, 0,153,51)
						end
						saveHouses()
					end
					if(tonumber(type) == 3) then
						if tonumber(getElementData ( getHouse(i), "lock" )) == 0 then
							setElementData ( getHouse(i), "lock", "1" )
							outputChatBox("Информация: Вы закрыли дверь в своем доме", source, 0,153,51)
						else
							setElementData ( getHouse(i), "lock", "0" )
							outputChatBox("Информация: Вы открыли дверь в своем доме", source, 0,153,51)
						end
						saveHouses()
					end
		--			if(type == 4) then
		--				 giveWeapon ( source, 34, 30 )
		--				 outputChatBox ("Вы взяли снайперскую винтовку",source, 55,204,255 )
		--			end
				end
			end
		end
	else
		outputChatBox("Подсказка: Изменить цену аренды - /housecontrol 1 [цена] ", source, 255,204,255)
		outputChatBox("Подсказка: Разрешить/запретить аренду - /housecontrol 2 ", source, 255,204,255)
		outputChatBox("Подсказка: Закрыть/открыть дом - /housecontrol 3 ", source, 255,204,255)
	end
end

addCommandHandler ("housecontrol", HouseOwnerFunction )