bizpickup={}

function loadBusineses ()
  local housesloaded
  maxbiz = 0
  local root = xmlLoadFile ("busineses.xml")
  local buildingroot = xmlFindChild (root,"home",0)
  if (buildingroot) then
    for i,v in ipairs (xmlNodeGetChildren(buildingroot)) do
      local price = xmlNodeGetAttribute (v,"price")
      local ownerid = xmlNodeGetAttribute (v,"ownerid")
	  local name = xmlNodeGetAttribute (v,"name")
      local x = xmlNodeGetAttribute (v,"x")
      local y = xmlNodeGetAttribute (v,"y")
      local z = xmlNodeGetAttribute (v,"z")
   	  local dim = tonumber(xmlNodeGetAttribute (v,"dim"))
      local interior = tonumber(xmlNodeGetAttribute (v,"int"))
      local value1 = xmlNodeGetAttribute (v,"value1")
      local value2 = xmlNodeGetAttribute (v,"value2")
      local value3 = xmlNodeGetAttribute (v,"value3")
      local value4 = xmlNodeGetAttribute (v,"value4")
      local value5 = xmlNodeGetAttribute (v,"value5")
      local opt1 = xmlNodeGetAttribute (v,"opt1")
      local opt2 = xmlNodeGetAttribute (v,"opt2")
      local opt3 = xmlNodeGetAttribute (v,"opt3")
      local lock = xmlNodeGetAttribute (v,"lock")
      local type = xmlNodeGetAttribute (v,"type")
	  if tonumber(ownerid) ~= 0 then
	      if tonumber(type) == 1 then        -- теле компания
		  	bizpickup[i] = createPickup ( x, y, z, 3, 1253, 3000 )
		  end
		  if tonumber(type) == 2 then        -- нарко притон
		  	bizpickup[i] = createPickup ( x, y, z, 3, 1279, 3000 )
		  end
		  if tonumber(type) == 3 then        -- магазин одежки
		  	bizpickup[i] = createPickup ( x, y, z, 3, 1275, 3000 )
		  end
		  if tonumber(type) == 5 then       -- фастфуд
		  	bizpickup[i] = createPickup ( x, y, z, 3, 1318, 3000 )
		  else              -- 6 заправка
		  	bizpickup[i] = createPickup ( x, y, z, 3, 1239, 3000 )
		  end
	  else
	  	  bizpickup[i] = createPickup ( x, y, z, 3, 1274, 3000 )
	  end
	  if type == 5 then
	  	createPickup ( tonumber(opt1), tonumber(opt2), tonumber(opt3), 3, 1582, 3000 )
	  end
      maxbiz = maxbiz + 1
      setElementData ( bizpickup[maxbiz], "owner", tonumber(ownerid) )
      setElementData ( bizpickup[maxbiz], "price", tonumber(price) )
      setElementData ( bizpickup[maxbiz], "name", name )
      setElementData ( bizpickup[maxbiz], "int", tonumber(interior) )
      setElementData ( bizpickup[maxbiz], "dim", tonumber(dim) )
      setElementData ( bizpickup[maxbiz], "value1", tonumber(value1) )
      setElementData ( bizpickup[maxbiz], "value2", tonumber(value2) )
      setElementData ( bizpickup[maxbiz], "value3", tonumber(value3) )
      setElementData ( bizpickup[maxbiz], "value4", tonumber(value4) )
      setElementData ( bizpickup[maxbiz], "value5", tonumber(value5) )
      setElementData ( bizpickup[maxbiz], "opt1", tonumber(opt1) )
      setElementData ( bizpickup[maxbiz], "opt2", tonumber(opt2) )
      setElementData ( bizpickup[maxbiz], "opt3", tonumber(opt3) )
      setElementData ( bizpickup[maxbiz], "rent", tonumber(rent) )
      setElementData ( bizpickup[maxbiz], "lock", tonumber(lock) )
      setElementData ( bizpickup[maxbiz], "products", tonumber(products) )
      setElementData ( bizpickup[maxbiz], "type", tonumber(type) )
      --houses[i]={price,ownerid,name,x,y,z,dim,interior,rent,lock,rentprice}
      housesloaded = 1
      if tonumber(type) == 12 then
      	callprice = tonumber(opt1)
      	smsprice = tonumber(opt2)
      end
      if tonumber(type) == 3 then        -- магазин одежки
	  	createBlipAttachedTo ( bizpickup[i], 45, 2, 255, 0, 0, 255, 0, 330 )
	  end
	  if tonumber(type) == 5 then       -- фастфуд
	  	createBlipAttachedTo ( bizpickup[i], 10, 2, 255, 0, 0, 255, 0, 330 )
	  elseif tonumber(type) == 6 then             -- 6 заправка
	  	--createBlipAttachedTo ( bizpickup[i], 63, 2, 255, 0, 0, 255, 0, 330 )
	  --	triggerClientEvent ( player, "createFillBlipS", player, x, y )
	  elseif tonumber(type) == 8 then
	    createBlipAttachedTo ( bizpickup[i], 18, 2, 255, 0, 0, 255, 0, 330 )
	  end
    end
  end
  if housesloaded == 1 then
  	outputDebugString ("Businesses loaded!")
  else
	outputDebugString ("Businesses not loaded!")
  end
end

function saveBusineses ()
	local root = xmlLoadFile ("busineses.xml")
	local houseroot = xmlFindChild (root,"home",0)
	if (houseroot) then
	    for i,v in ipairs (xmlNodeGetChildren(houseroot)) do
	      local px, py, pz = getElementPosition ( bizpickup[i] )
	      xmlNodeSetAttribute ( v, "price", getElementData(bizpickup[i], "price") )
	      xmlNodeSetAttribute ( v, "ownerid", getElementData(bizpickup[i], "owner") )
	      xmlNodeSetAttribute ( v, "name", getElementData(bizpickup[i], "name") )
	      xmlNodeSetAttribute ( v, "x", px )
		  xmlNodeSetAttribute ( v, "y", py )
		  xmlNodeSetAttribute ( v, "z", pz )
		  xmlNodeSetAttribute ( v, "dim", getElementData(bizpickup[i], "dim") )
	      xmlNodeSetAttribute ( v, "int", getElementData(bizpickup[i], "int") )
	      xmlNodeSetAttribute ( v, "value1", getElementData(bizpickup[i], "value1") )
		  xmlNodeSetAttribute ( v, "value2", getElementData(bizpickup[i], "value2") )
		  xmlNodeSetAttribute ( v, "value3", getElementData(bizpickup[i], "value3") )
		  xmlNodeSetAttribute ( v, "value4", getElementData(bizpickup[i], "value4") )
		  xmlNodeSetAttribute ( v, "value5", getElementData(bizpickup[i], "value5") )
		  xmlNodeSetAttribute ( v, "opt1", getElementData(bizpickup[i], "opt1") )
		  xmlNodeSetAttribute ( v, "opt2", getElementData(bizpickup[i], "opt2") )
		  xmlNodeSetAttribute ( v, "opt3", getElementData(bizpickup[i], "opt3") )
		  xmlNodeSetAttribute ( v, "lock", getElementData(bizpickup[i], "lock") )
		  xmlNodeSetAttribute ( v, "products", getElementData(bizpickup[i], "products") )
	    end
	    xmlSaveFile(root)
    end
    outputDebugString ("Busineses saved!")
end

addEventHandler ( "onResourceStart", getResourceRootElement(), loadBusineses )
addCommandHandler ("abizsave", saveBusineses)

function toBuisnes ( dim, player )
	for i,v in ipairs (bizpickup) do
    	local bx, by, bz = getElementPosition(bizpickup[i] )
    	local biztype = tonumber(getElementData(bizpickup[i], "type" ))
    	local value1 = tonumber(getElementData(bizpickup[i], "value1" ))
    	local value2 = tonumber(getElementData(bizpickup[i], "value2" ))
    	local opt1 = getElementData(bizpickup[i], "opt1" )
    	local opt2 = getElementData(bizpickup[i], "opt2" )
    	local opt3 = getElementData(bizpickup[i], "opt3" )
    	local busid = tonumber(getElementData(bizpickup[i], "dim" ))
    	if exports.sweetyRP:playerToPoint ( player, 2, 2.3837,-29.0126,1003.5494 ) then
			if getElementData ( player, "busid" ) == getElementData(bizpickup[i], "dim" ) then
				triggerClientEvent ( player, "inFullShop", player, busid )
			end
		end
		if exports.sweetyRP:playerToPoint ( player, 2, 5.912109375,-31.7568359375,1003.5494384766 ) then
			if getElementData ( player, "busid" ) == getElementData(bizpickup[i], "dim" ) then
    			setElementPosition ( player, bx, by, bz )
    			setElementInterior ( player, 0 )
    			setElementData ( player, "busid", 0 )
    			return true
			end
		end
		if exports.sweetyRP:playerToPoint ( player, 2, 288.0966796875,-109.7119140625,1001.515625 ) then
			if getElementData ( player, "busid" ) == getElementData(bizpickup[i], "dim" ) then
				triggerClientEvent ( player, "showBuyEquip", player, busid )
			end
		end
		if exports.sweetyRP:playerToPoint ( player, 2, 296.775390625,-111.8935546875,1001.515625 ) then
			if getElementData ( player, "busid" ) == getElementData(bizpickup[i], "dim" ) then
    			setElementPosition ( player, bx, by, bz )
    			setElementInterior ( player, 0 )
    			setElementData ( player, "busid", 0 )
    			return true
			end
		end
		if exports.sweetyRP:playerToPoint ( player, 2, 1038.2190,6.9905,1001.2840 ) then
			if getElementData ( player, "busid" ) == getElementData(bizpickup[i], "dim" ) then
    			setElementPosition ( player, bx, by, bz )
    			setElementInterior ( player, 0 )
    			setElementData ( player, "busid", 0 )
    			return true
			end
		end
		if(exports.sweetyRP:playerToPoint(player, 3, bx, by, bz)) then
			if biztype == 2 then
				setElementPosition(player, 1038.2190, 6.9905, 1001.2840)
				setElementInterior ( player, 3 )
				setElementData ( player, "busid", busid )
				entsucces = 1
			end
			if biztype == 3 then
				exports.nskin:clothShopEvent( player )
				setElementData ( player, "busid", busid )
				--toggleAllControls ( player, false, true, false )
			end
			if biztype == 7 then
				setElementPosition(player, 6.0780,-28.6330,1003.5490 )
				setElementInterior ( player, 10 )
				setElementData ( player, "busid", busid )
			end
  			if biztype == 8 then
				setElementPosition(player, 297.4460,-109.9680,1001.5160 )
				setElementInterior ( player, 6 )
				setElementData ( player, "busid", busid )
			end
			return true
		end
		if exports.sweetyRP:playerToPoint(player, 3, opt1, opt2, opt3 ) then
			if biztype == 5 then
				outputChatBox("Информация: Стоимость еды: "..tostring(value2).." долларов", player, 0,153,51)
				exports.sweetyRP:sendClientActionMessage ( player, 3 )
				takePlayerMoney ( player, value2 )
				setTimer ( eatComplete, 2000, 1, player)
				toggleAllControls ( player, false, true, false )
				setElementData ( bizpickup[i], "value1", value1+value2 )
			end
			if biztype == 6 then
				local car = getPedOccupiedVehicle ( player )
				if car ~= nil then
				    --if value4 > 0 then
						if getPlayerMoney ( player ) >= value1 then
							local complete = math.random(1,3)
							toggleAllControls ( player, false, true, false )
							if complete == 1 then
								setTimer ( CompleteFuel, 8000, 1, player, car )
							end
							if complete == 2 then
								setTimer ( CompleteFuel, 5000, 1, player, car )
							end
							if complete == 3 then
								setTimer ( CompleteFuel, 11000, 1, player, car )
							end
							outputChatBox("Информация: Ваша машина сейчас будет заправленна бензином, стоимость: "..tostring(value2).." долларов", player, 0,153,51)
							takePlayerMoney ( player, tonumber(value2 ) )
							setElementData ( bizpickup[i], "value1", value1+value2 )
						end
--					else
--						outputChatBox("Информация: Извините, на заправке нет топлива ", player, 0,153,51)
--					end
				end
			end
		end
	end
end

function getBizByOwner ( playerid )
	for i,v in ipairs (bizpickup) do
		if getElementData ( bizpickup[i], "ownerid" ) == playerid then 
			return bizpickup[i]
		end
	end
end


function eatComplete ( source )
	toggleAllControls ( source, true )
    setElementHealth ( source, getElementHealth(source) + 40 )
    outputChatBox ("Удачи! Будем ждать вас еще!", source,255,255,127 )
end

function completeEatFastFood ( source )
	outputChatBox("Информация: Вы доели, можете ехать", source, 0,153,51)
    toggleAllControls ( driver, true, true, true )
    exports.sweetyRP:sendClientActionMessage ( source, 4 )
    setElementHealth ( source, getElementHealth(source) + 50 )
end

function CompleteFuel ( source, car )
	setElementData ( car, "fuel", 100 )
	toggleAllControls ( source, true, true, true )
	outputChatBox("Информация: Машина заправленна, можете ехать. Счетчкик обновится в течении нескольких секунд", source, 0,153,51)
end

function getBiz ( biz )
	return bizpickup[biz]
end

function setMaxBiz ( biz )
	maxbiz = biz
end

function getMaxBiz ()
	return maxbiz
end

function createNewBiz ( x, y, z )
	bizpickup[maxbiz] = createPickup ( x, y, z, 3, 1273, 3000 )
end

function Adversitment( source, cmd, ... )
	local px, py, pz = getElementPosition ( source )
	if PlayerToPoint(source,1038.2190,6.9905,1001.2840, 3) then
		for i,v in ipairs (bizpickup) do
			if(getElementData(bizpickup[i], "type") == 2) then
				local price = getElementData ( bizpickup[i], "value2" )
				if getPlayerMoney(source) > price then
					local parametersTable = {...}
				   	local text = table.concat(parametersTable, " ")
					if (text) then
						for id, player in ipairs ( getElementsByType ( "player" ) ) do
							outputChatBox ( " Реклама:" .. tostring(text) .. ". Отправитель:  " .. getPlayerName(source) .. "  ", source, 255,204,51 )
						end
						givePlayerMoney(source, -price)
						outputChatBox ("Информация: цена рекламы - "..tostring(price).."$",source, 0,153,51 )
					else
					  		outputChatBox ("Правильно: /ad текст ",  source, 255,102,51 )
					end
				else
					outputChatBox ("Ошибка: у вас недостаточно денег, цена рекламы - "..tostring(price).."$",source, 102, 0, 0)
				end
			end
		end
	else
		outputChatBox ("Ошибка: вы должны быть в кинокомпании",source, 255,255,127 )
	end
end

addCommandHandler ("adv", Adversitment)


function completeBuy( price, busid )
	for i,v in ipairs (bizpickup) do
		if(getElementData(bizpickup[i], "dim") == busid) then
			local endprice = getElementData ( bizpickup[i], "value1" ) + price
			setElementData ( bizpickup[i], "value1", endprice )
		end
	end
end

addEvent("completeBuying",true)
addEventHandler("completeBuying",root,completeBuy)

function fullBuy( eqnum, busid, price )
	for i,v in ipairs (bizpickup) do
		if i == busid then
			local endprice = getElementData ( bizpickup[i], "value1" ) + price
			setElementData ( bizpickup[i], "value1", endprice )
			if(eqnum == 1) then
				setElementData ( source, "mask", 1 )
				outputChatBox("Информация: Вы купили маску! Цена: 300$", source,0,153,51)
				takePlayerMoney ( source, 300 )
			end
			if(eqnum == 2) then
				setElementData ( source, "tie", 1 )
				outputChatBox("Информация: Вы купили веревку! Цена: 200$", source,0,153,51)
				takePlayerMoney ( source, 200 )	
			end
			if(eqnum == 3) then
		
				outputChatBox("Информация: Вы купили камеру! Цена: 1000$", source,0,153,51)
				giveWeapon ( source, 43, 20 )
				takePlayerMoney ( source, 1000 )	
			end
			if(eqnum == 4) then
				takePlayerMoney ( source, 500 )
				local phonenum = math.random(1000,99999)
				setElementData ( source, "phone", phonenum )
				outputChatBox("Информация: Вы купили телефон! Номер: "..tostring(phonenum)..".Цена: 200$", source, 0,153,51)	
			end
			if(eqnum == 5) then
				outputChatBox("Информация: Вы купили карточку для пополонения телефона на 100$", source, 0,153,51)
				takePlayerMoney ( source, 100 )
				local pmoney = tonumber(getElementData ( source, "pmoney" ))
				setElementData ( source, "pmoney", pmoney+100)
			end
			if(eqnum == 6) then
				outputChatBox("Информация: Вы купили карточку для пополонения телефона на 200$", source, 0,153,51)
				takePlayerMoney ( source, 200 )
				local pmoney = tonumber(getElementData ( source, "pmoney" ))
				setElementData ( source, "pmoney", pmoney+200)
			end
			if(eqnum == 7) then
				outputChatBox("Информация: Вы купили карточку для пополонения телефона на 300$", source, 0,153,51)
				takePlayerMoney ( source, 300 )
				local pmoney = tonumber(getElementData ( source, "pmoney" ))
				setElementData ( source, "pmoney", pmoney+300)
			end
			if(eqnum == 8) then
				outputChatBox("Информация: Вы купили букет цветов. Цена: 100$", source, 0,153,51)
				takePlayerMoney ( source, 100 )
                giveWeapon ( source, 14 , 1, true )
			end
			if(eqnum == 9) then
    			outputChatBox("Информация: Вы купили дилдо. Цена: 150$", source, 0,153,51)
				takePlayerMoney ( source, 150 )
                giveWeapon ( source, 10 , 1, true )
			end
			if(eqnum == 10) then
    			outputChatBox("Информация: Вы купили бейсбольную биту. Цена: 150$", source, 0,153,51)
				takePlayerMoney ( source, 150 )
                giveWeapon ( source, 5 , 1, true )
			end
			if(eqnum == 11) then
    			outputChatBox("Информация: Вы купили лопату. Цена: 100$", source, 0,153,51)
				takePlayerMoney ( source, 100 )
                giveWeapon ( source, 6 , 1, true )
			end
		end
	end
end	
addEvent("fullShopBuy",true)
addEventHandler("fullShopBuy",root,fullBuy)

function equipBuy( eqnum, busid, price )
	for i,v in ipairs (bizpickup) do
		if(getElementData(bizpickup[i], "dim") == busid) then
			local endprice = getElementData ( bizpickup[i], "value1" ) + price
			setElementData ( bizpickup[i], "value1", endprice )
			if(eqnum == 1) then
		        giveWeapon ( source, 29, 50 )
				outputChatBox ("Вы купили MP5",source, 55,204,255 )
				takePlayerMoney ( source, 3000 )	
			end
			if(eqnum == 2) then
				 giveWeapon ( source, 30, 60 )
				 outputChatBox ("Вы купили AK-47",source, 55,204,255 )
				takePlayerMoney ( source, 5000 )	
			end
			if(eqnum == 3) then
				 giveWeapon ( source, 33, 30 )
				 outputChatBox ("Вы купили деревенскую винтовку",source, 55,204,255 )
				 takePlayerMoney ( source, 1500 )
			end
			if(eqnum == 4) then
				 giveWeapon ( source, 34, 10 )
				 outputChatBox ("Вы купили снайперскую винтовку",source, 55,204,255 )
				 takePlayerMoney ( source, 10000 )
			end
			if(eqnum == 5) then
				 giveWeapon ( source, 22, 25 )
				 outputChatBox ("Вы купили Кольт-45",source, 55,204,255 )
				 takePlayerMoney ( source, 1000 )
			end
			if(eqnum == 6) then
				 giveWeapon ( source, 28, 50 )
				 outputChatBox ("Вы купили UZI",source, 55,204,255 )
				 takePlayerMoney ( source, 2000)
			end
			if(eqnum == 7) then
				 giveWeapon ( source, 23, 25 )
				 outputChatBox ("Вы купили пистолет с глушителем",source, 55,204,255 )
				 takePlayerMoney ( source, 1500 )
			end
			if(eqnum == 8) then
				 giveWeapon ( source, 24, 15 )
				 outputChatBox ("Вы купили Desert Eagle",source, 55,204,255 )
				 takePlayerMoney ( source, 2000 )
			end
			if(eqnum == 9) then
				 giveWeapon ( source, 4 )
				 outputChatBox ("Вы купили нож",source, 55,204,255 )
				 takePlayerMoney ( source, 500 )
			end
			if(eqnum == 10) then
				 giveWeapon ( source, 43, 25 )
				 outputChatBox ("Вы купили камеру",source, 55,204,255 )
				 takePlayerMoney ( source, 1000 )
			end
			if(eqnum == 11) then
				 giveWeapon ( source, 46 )
				 outputChatBox ("Вы купили парашут",source, 55,204,255 )
				 takePlayerMoney ( source, 1000 )
			end
			if(eqnum == 12) then
				 giveWeapon ( source, 25, 20 )
				 outputChatBox ("Вы купили шотган",source, 55,204,255 )
				 takePlayerMoney ( source, 1500 )
			end
		end
	end
end

addEvent("buyEquip",true)
addEventHandler("buyEquip",root,equipBuy)

function giveBizMoney( biztype, price, money ) -- 8 - оружейки
	for i,v in ipairs (bizpickup) do
		if(tonumber(getElementData(bizpickup[i], "type")) == biztype) then
			local endprice = getElementData ( bizpickup[i], "value1" ) + price
			setElementData ( bizpickup[i], "value1", endprice )
			exports.factions:giveFactionMoney ( 3, money )
			saveBusineses ()
		end
	end
end

addEvent("giveToBizMoney",true)
addEventHandler("giveToBizMoney",root,giveBizMoney)

function giveToBizValue( busid, money )
	for i,v in ipairs (bizpickup) do
		if(busid == getElementData (v, "dim")) then
			local endprice = getElementData ( bizpickup[i], "value1" ) + money
			setElementData ( bizpickup[i], "value1", endprice )
			saveBusineses ()
		end
	end
end

function startCreateFillIcon( )
	for i,v in ipairs (bizpickup) do
		local x, y, z = getElementPosition(bizpickup[i])
		triggerClientEvent ( source, "createFillBlipS", source, x, y )
	end
end

addEvent("startCreateFillIconC",true)
addEventHandler("startCreateFillIconC",root,startCreateFillIcon)
