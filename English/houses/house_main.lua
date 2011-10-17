housepickup={}
buyhousepickup={}

function loadHouses ()
  local housesloaded
  maxhouses = 0
  local root = xmlLoadFile ("houses.xml")
  local buildingroot = xmlFindChild (root,"home",0)
  if (buildingroot) then
    for i,v in ipairs (xmlNodeGetChildren(buildingroot)) do
      local price = xmlNodeGetAttribute (v,"price")
      local ownerid = xmlNodeGetAttribute (v,"ownerid")
	  local name = xmlNodeGetAttribute (v,"name")
      local x = xmlNodeGetAttribute (v,"x")
      local y = xmlNodeGetAttribute (v,"y")
      local z = xmlNodeGetAttribute (v,"z")
	  local dim = xmlNodeGetAttribute (v,"dim")
      local interior = xmlNodeGetAttribute (v,"int")
      local rent = xmlNodeGetAttribute (v,"rent")
      local lock = xmlNodeGetAttribute (v,"lock")
      local rentprice = xmlNodeGetAttribute (v,"rentprice")
      local renters = xmlNodeGetAttribute (v,"renters")
      local moneys = xmlNodeGetAttribute (v,"moneys")
	  housepickup[i] = createPickup ( x, y, z, 3, 1273, 3000 )
      maxhouses = maxhouses + 1
      if tonumber(getElementData ( housepickup[maxhouses], "ownerid" )) == 0 then
	  	buyhousepickup[maxhouses] = createPickup ( x, y, z, 3, 1274 )
		attachElements ( buyhousepickup[maxhouses], housepickup[maxhouses], 0, 0, 1 )
	  end
      setElementData ( housepickup[maxhouses], "owner", tonumber(ownerid) )
      setElementData ( housepickup[maxhouses], "price", tonumber(price) )
      setElementData ( housepickup[maxhouses], "name", name )
      setElementData ( housepickup[maxhouses], "int", tonumber(interior) )
      setElementData ( housepickup[maxhouses], "dim", tonumber(dim) )
      setElementData ( housepickup[maxhouses], "rent", tonumber(rent) )
      setElementData ( housepickup[maxhouses], "lock", tonumber(lock) )
      setElementData ( housepickup[maxhouses], "rentprice", tonumber(rentprice) )
      setElementData ( housepickup[maxhouses], "renters", tonumber(renters) )
      setElementData ( housepickup[maxhouses], "moneys", tonumber(moneys) )
     -- setElementData ( housepickup[maxhouses], "renters", renters )
      housesloaded = 1
    end
  end
  if housesloaded == 1 then
  	outputDebugString ("Houses loaded!")
  else
	outputDebugString ("Houses not loaded!")
  end
end

addEventHandler ( "onResourceStart", getResourceRootElement(), loadHouses )

function saveHouses ()
	local root = xmlLoadFile ("houses.xml")
	local houseroot = xmlFindChild (root,"home",0)
	if (houseroot) then
	    for i,v in ipairs (xmlNodeGetChildren(houseroot)) do
	      local px, py, pz = getElementPosition ( housepickup[i] )
	      xmlNodeSetAttribute ( v, "price", getElementData(housepickup[i], "price") )
	      xmlNodeSetAttribute ( v, "ownerid", getElementData(housepickup[i], "owner") )
	      xmlNodeSetAttribute ( v, "name", getElementData(housepickup[i], "name") )
	      xmlNodeSetAttribute ( v, "x", px )
		  xmlNodeSetAttribute ( v, "y", py )
		  xmlNodeSetAttribute ( v, "z", pz )
		  xmlNodeSetAttribute ( v, "dim", getElementData(housepickup[i], "dim") )
	      xmlNodeSetAttribute ( v, "int", getElementData(housepickup[i], "int") )
	      xmlNodeSetAttribute ( v, "rent", getElementData(housepickup[i], "rent") )
		  xmlNodeSetAttribute ( v, "lock", getElementData(housepickup[i], "lock") )
		  xmlNodeSetAttribute ( v, "rentprice", getElementData(housepickup[i], "rentprice") )
		  xmlNodeSetAttribute ( v, "renters", getElementData(housepickup[i], "renters") )
		  xmlNodeSetAttribute ( v, "moneys", getElementData(housepickup[i], "moneys") )
		  --xmlNodeSetAttribute ( v, "renters", getElementData(housepickup[i], "renters") )
	    end
	    xmlSaveFile(root)
    end
    outputDebugString ("Houses saved!")
end

function getHouse ( house )
	return housepickup[house]
end

function setMaxHouses ( house )
	maxhouses = house
end

function changeMoneyFromGUIS ( type, money )
	if type == 1 then
		setElementData ( housepickup[getElementData(source,"house" )], "moneys", money )
	elseif type == 2 then
		setElementData ( housepickup[getElementData(source,"house" )], "rentprice", money )
	elseif type == 3 then
		setElementData ( housepickup[getElementData(source,"house" )], "rent", 0 )
		setElementData ( housepickup[getElementData(source,"house" )], "renters", 0 )
	elseif type == 4 then
		setElementData ( housepickup[getElementData(source,"house" )], "rent", 1 )
	elseif type == 5 then
		setElementData ( housepickup[getElementData(source,"house" )], "owner", "0" )
	 	setElementData ( housepickup[getElementData(source,"house" )], "name", "Nobody" )
		outputChatBox ("Вы продали свой дом!",source, 243,149,72 )
		saveHouses ()
		givePlayerMoney ( source, getElementData ( housepickup[getElementData(source,"house" )], "price" ) )
		local x, y, z = getElementPosition(housepickup[getElementData(source,"house" )])
		buyhousepickup[getElementData(source,"house" )] = createPickup ( x, y, z+1, 3, 1274 )
		setElementData ( source, "house", 0 )
	end	
	saveHouses ()
end
addEvent("changeMoneyFromGUI",true)
addEventHandler("changeMoneyFromGUI",root,changeMoneyFromGUIS)

--function PlayerSellHouse ( source, cmd)
--	local sellsucces = 0
--	for i,v in ipairs (housepickup) do
--		local hx, hy, hz = getElementPosition ( housepickup[i] )
--		if(exports.sweetyRP:playerToPoint(source, 3, hx, hy, hz)) then
--		    if getElementData ( source, "house" ) == i then
--		        setElementData ( housepickup[i], "owner", "0" )
--			 	setElementData ( housepickup[i], "name", "Nobody" )
--			 	setElementData ( source, "house", 0 )
--      			outputChatBox ("Вы продали свой дом!",source, 243,149,72 )
--      			saveHouses ()
--      			sellsucces = 1
--      			givePlayerMoney ( source, getElementData ( housepickup[i], "price" ) )
--      			buyhousepickup[i] = createPickup ( hx, hy, hz+1, 3, 1274 )
--  			end
--  		end
--	end
--	if sellsucces == nil then
--		outputChatBox ("Ошибка: вы не рядом со своим домом",source, 255,255,127 )
--	end
--end
--
--addCommandHandler ("housesell", PlayerSellHouse)

function controlPlayerHouse ( source, cmd )
	local sellsucces = nil
	for i,v in ipairs (housepickup) do
	    if getElementData ( housepickup[i], "owner" ) == getElementData ( source, "playerid" )  then
	    	sellsucces = 1
	        triggerClientEvent ( source, "showHouseControlFunctionS", source, getElementData ( housepickup[i], "owner" ), getElementData ( housepickup[i], "price" ), getElementData ( housepickup[i], "moneys" ), getElementData ( housepickup[i], "rent" ), getElementData ( housepickup[i], "rentprice" ), getElementData ( housepickup[i], "renters" ) )
		end
	end
	if sellsucces == nil then
		outputChatBox ("Ошибка: вы не рядом со своим домом",source, 255,255,127 )
	end
end

addCommandHandler ("house", controlPlayerHouse)

function AcceptToBuyHouse ( number, price )
	setElementData(housepickup[number], "owner", getElementData ( source, "playerid" ))
	setElementData(housepickup[number], "name", getPlayerName ( source ) )
	takePlayerMoney ( source, price )
	setElementData ( source, "house", number )
	outputChatBox ("Поздравляем с покупкой дома!", source, 243,149,72 )
	outputChatBox ("Подсказка: для управления домом - встаньте на его пикап и введите /house", source, 255,204,255 )
	saveHouses ()
end
addEvent("acceptBuyHouse",true)
addEventHandler("acceptBuyHouse",root,AcceptToBuyHouse)

function AcceptToRentHouse ( number, price )
	setElementData ( source, "houserent", number)
 	takePlayerMoney ( source, price )
 	setElementData ( housepikcup[number], "renters", getElementData ( housepikcup[number], "renters") + 1 )
 	giveHouseMoney ( number, price )
	outputChatBox ("Вы арендуете дом у "..tostring(getElementData(housepickup[number], "name")).."", source, 243,149,72 )
	outputChatBox ("Информация: каждый час с вас будет сниматься арендная плата.", source, 0,153,51 )
	outputChatBox ("Подсказка: чтобы прекратить аренду - введите /stoprent", source, 255,204,255 )
	saveHouses ()
end
addEvent("acceptRentHouse",true)
addEventHandler("acceptRentHouse",root,AcceptToRentHouse)

function playerStopHouseRent ( source, cmd)
 	setElementData ( housepikcup[number], "renters", getElementData ( housepikcup[getElementData ( source, "houserent")], "renters") - 1 )
	outputChatBox ("Информация: Вы больше не арендуете дом", source, 0,153,51 )
	setElementData ( source, "houserent", 0)
end

addCommandHandler ("stoprent", playerStopHouseRent)

function enterHouse( source, number )
	local hint = tonumber(getElementData( housepickup[number], "int" ))
	setElementDimension ( source, getElementData(housepickup[number], "dim" ) )
	entsucces = 1
	if(hint == 1) then
		setElementPosition ( source, 223.043991,1289.259888,1082.199951 )
		setElementInterior ( source, 1 )
	end
	if(hint == 2) then
		setElementPosition ( source, 295.138977,1474.469971,1080.519897 )
		setElementInterior ( source, 15 )
	end
	if(hint == 3) then
		setElementPosition ( source, 328.493988,1480.589966,1084.449951 )
		setElementInterior ( source, 15 )
	end
	if(hint == 4) then
		setElementPosition ( source, 2262.83,-1137.71,1050.63 )
		setElementInterior ( source, 10 )
	end
	if(hint == 5) then
		setElementPosition ( source, 2251.85,-1138.16,1050.63 )
		setElementInterior ( source, 9 )
	end
	if(hint == 6) then
		setElementPosition ( source, 225.756989,1240.000000,1082.149902 )
		setElementInterior ( source, 2 )
	end
	if(hint == 7) then
		setElementPosition ( source, 2451.77, -1699.80,1013.51 )
		setElementInterior ( source, 2 )
	end
	if(hint == 8) then
		setElementPosition ( source, 385.803986,1471.769897,1080.209961 )
		setElementInterior ( source, 15 )
	end
	if(hint == 9) then
		setElementPosition ( source, 2260.76,-1210.45,1049.02 )
		setElementInterior ( source, 10 )
	end
	if(hint == 10) then
		setElementPosition ( source, 235.508994,1189.169897,1080.339966 )
		setElementInterior ( source, 3 )
	end
	if(hint == 11) then
		setElementPosition ( source, 225.630997,1022.479980,1084.069946 )
		setElementInterior ( source, 7 )
	end
	if(hint == 12) then
		setElementPosition ( source, 2807.63,-1170.15,1025.57 )
		setElementInterior ( source, 8 )
	end
	if(hint == 13) then
		setElementPosition ( source, -2158.72,641.29,1052.38 )
		setElementInterior ( source, 1 )
	end
	if(hint == 14) then
		setElementPosition ( source, 244.0892, 304.8456, 999.1484 )
		setElementInterior ( source, 1 )
	end
	if(hint == 15) then
		setElementPosition ( source, 2525.0420, -1679.1150, 1015.4990 )
		setElementInterior ( source, 1 )
	end
	if(hint == 16) then
		setElementPosition ( source, 2216.5400, -1076.2900, 1050.4840 )
		setElementInterior ( source, 1 )
	end
	if(hint == 17) then
		setElementPosition ( source, 0.3440, -0.5140, 1000.5490 )
		setElementInterior ( source, 2 )
	end
	if(hint == 18) then
		setElementPosition ( source, 1523.7510, -46.0458, 1002.1310 )
		setElementInterior ( source, 2 )
	end
	if(hint == 19) then
		setElementPosition ( source, 2543.6610, -1303.9320, 1025.0700 )
		setElementInterior ( source, 2 )
	end
	if(hint == 20) then
		setElementPosition ( source, 267.2290, 304.7100, 999.1480 )
		setElementInterior ( source, 2 )
	end
	if(hint == 21) then
		setElementPosition ( source, 1527.38, -11.02, 1002.10 )
		setElementInterior ( source, 3 )
	end
	if(hint == 22) then
		setElementPosition ( source, 516.8890, -18.4120, 1001.5650 )
		setElementInterior ( source, 3 )
	end
	if(hint == 23) then
		setElementPosition ( source, 302.6404, 304.8048, 999.1484 )
		setElementInterior ( source, 4 )
	end
	if(hint == 24) then
		setElementPosition ( source, 1272.9116, -768.9028, 1090.5097 )
		setElementInterior ( source, 5 )
	end
	if(hint == 25) then
		setElementPosition ( source, 2807.8990, -1172.9210, 1025.5700 )
		setElementInterior ( source, 8 )
	end
	if(hint == 26) then
		setElementPosition ( source, 2253.1740, -1139.0100, 1050.6330 )
		setElementInterior ( source, 9 )
	end
	if(hint == 27) then
		setElementPosition ( source, 2264.5231, -1210.5229, 1049.0234 )
		setElementInterior ( source, 10 )
	end
	if(hint == 28) then
		setElementPosition ( source, 2324.4990, -1147.0710, 1050.7100 )
		setElementInterior ( source, 12 )
	end
	if(hint == 29) then
		setElementPosition ( source, 322.72, 306.43, 999.15 )
		setElementInterior ( source, 5 )
	end
	if(hint == 30) then
		setElementPosition ( source, 2333.0330, -1073.9600, 1049.0230 )
		setElementInterior ( source, 6 )
	end
	if(hint == 31) then
		setElementPosition ( source, 2194.2910, -1204.0150, 1049.0230 )
		setElementInterior ( source, 6 )
	end
	if(hint == 32) then
		setElementPosition ( source, 2308.8710, -1210.7170, 1049.0230 )
		setElementInterior ( source, 6 )
	end
	setElementData ( source, "inhouse", 1 )
	exports.players:entSucces ( source )
end

function enterHouse1 ( number )
 enterHouse( source, number )
end
addEvent("acceptEnterHouse",true)
addEventHandler("acceptEnterHouse",root,enterHouse1)

function getMaxHouses ()
	return maxhouses
end

function createNewHouse ( x, y, z )
	housepickup[maxhouses] = createPickup ( x, y, z, 3, 1273, 3000 )
end

function toHouse ( dim, player )
for i,v in ipairs ( housepickup ) do
    	local hx, hy, hz = getElementPosition ( housepickup[i] )
		if(exports.sweetyRP:playerToPoint(player, 3, hx, hy, hz)) then
		    local price = getElementData ( housepickup[i], "price" )
		    local rentprice = getElementData (  housepickup[i], "rentprice" )
			local owner = getElementData(  housepickup[i], "owner" )
			local rentplayer = getElementData ( housepickup[i], "rentplayer" )
--			if owner == tonumber(getElementData(source, "playerid")) then
--				triggerClientEvent ( source, "showHouseOwner", getRootElement(), price, rentprice, rent, rentplayer, lock)
--				return true
--			end
			if tonumber(owner) > 0 then
				local lock = getElementData( housepickup[i], "lock" )
				local owner = getElementData( housepickup[i], "name" )
				triggerClientEvent ( player, "showHouseMenu", player, owner, price, rentprice, i, lock)
				return true
			else
			    triggerClientEvent ( player, "showBuyHouse", player, price, i)
			    return true
			end
		end
		if( dim == tonumber(getElementData(housepickup[i], "dim" ))) then
			if getElementData ( player, "inhouse" ) == 1 then
        		setElementInterior ( player, 0 )
				setElementDimension ( player, 0 )
				setElementPosition ( player, hx, hy, hz )
				setElementData ( player, "inhouse", 1 )
				return true
			end
		end
	end
	return true
end

function giveHouseMoney ( number, money)
	for i,v in ipairs (housepickup) do
	    if number == i then
	        setElementData ( housepickup[i], "money", getElementData ( housepickup[i], "money" ) + money )
		end
	end
end
