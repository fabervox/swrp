cars={}
buycarpickup={}
maxcars = 0

addEventHandler ( "onResourceStart", getResourceRootElement(),
function ()
  local root = xmlLoadFile ("cars.xml")
  local houseroot = xmlFindChild (root,"cars",0)
  setTimer ( SeeTheCars, 30000, 0 )
  if (houseroot) then
    for i,v in ipairs (xmlNodeGetChildren(houseroot)) do
	  local carmodel = xmlNodeGetAttribute (v,"model")
      local x = xmlNodeGetAttribute (v,"x")
      local y = xmlNodeGetAttribute (v,"y")
      local z = xmlNodeGetAttribute (v,"z")
	  local color1 = xmlNodeGetAttribute (v,"color1")
	  local color2 = xmlNodeGetAttribute (v,"color2")
      local owner = xmlNodeGetAttribute (v,"owner")
      local cartype = xmlNodeGetAttribute (v,"type")
	  local price = xmlNodeGetAttribute (v,"price")
	  local lock = xmlNodeGetAttribute (v,"lock")
	  local a = xmlNodeGetAttribute (v,"a")
      cars[i] = createVehicle ( tonumber(carmodel),tonumber(x),tonumber(y),tonumber(z), 0, 0, tonumber(a) )
      setElementInterior ( cars[i], 0 )
      setElementData (cars[i],"xpos",tonumber(x))
	  setElementData (cars[i],"ypos",tonumber(y))
	  setElementData (cars[i],"zpos",tonumber(z))
	  setElementData (cars[i],"angle",tonumber(a))
      setElementData (cars[i],"owner",tonumber(owner))
	  setElementData (cars[i],"price",tonumber(price))
	  setElementData (cars[i],"type",tonumber(cartype))
	  setElementData (cars[i],"lock",tonumber(lock))
	  setElementData (cars[i],"fuel",100)
	  setVehicleColor ( cars[i], tonumber(color1), tonumber(color2), 0, 0 )
	  if(lock == 1) then
	  	setVehicleLocked ( car, true )
	  end
	  if getElementData ( cars[i], "type" ) == 8 then
	  	if getElementData ( cars[i], "owner" ) == 0 then
			buycarpickup[i] = createPickup ( x,  y, z, 3, 1274 )
			attachElements ( buycarpickup[i], cars[i], 0, 0, 1.5 )
	  	end
	  end
	  maxcars = maxcars+1
    end
    outputDebugString ("Cars loaded!")
  end
end
)

addEventHandler( "onPlayerJoin", root,
	function( )
		bindKey( source, "l", "down", "togglelights" )
	end
)

addCommandHandler( "togglelights",
	function( player, commandName )
		if exports.players:isLoggedIn( player ) then
			local vehicle = getPedOccupiedVehicle( player )
			if vehicle and getVehicleOccupant( vehicle ) == player then
				local data = cars[ vehicle ]
				setVehicleOverrideLights( vehicle, getVehicleOverrideLights( vehicle ) == 2 and 1 or 2 )
			end
		end
	end
)


function saveCars ()
	local root = xmlLoadFile ("cars.xml")
	local houseroot = xmlFindChild (root,"cars",0)
	if (houseroot) then
	    for i,v in ipairs (xmlNodeGetChildren(houseroot)) do
	     local color1, color2, color3, color4 = getVehicleColor ( cars[i] )
	      xmlNodeSetAttribute ( v, "model", getElementModel(cars[i]) )
	      xmlNodeSetAttribute ( v, "x", getElementData(cars[i], "xpos") )
	      xmlNodeSetAttribute ( v, "y", getElementData(cars[i], "ypos") )
	      xmlNodeSetAttribute ( v, "z", getElementData(cars[i], "zpos") )
		  xmlNodeSetAttribute ( v, "a", getElementData(cars[i], "angle") )
		  xmlNodeSetAttribute ( v, "color1", color1 )
		  xmlNodeSetAttribute ( v, "color2", color2 )
	      xmlNodeSetAttribute ( v, "owner", getElementData(cars[i], "owner") )
	      xmlNodeSetAttribute ( v, "type", getElementData(cars[i], "type") )
		  xmlNodeSetAttribute ( v, "price", getElementData(cars[i], "price") )
		  xmlNodeSetAttribute ( v, "lock", getElementData(cars[i], "lock") )
	    end
	    xmlSaveFile(root)
    end
end

function adminCreateVehicle ( source, cmd )
	if(tonumber(getElementData(source,"admlvl")) > 2) then
  	  local root = xmlLoadFile ("cars.xml")
  	  local houseroot = xmlFindChild (root,"cars",0)
      local createdcar = xmlCreateChild ( houseroot, "vehicle" )
	  local carmodel = xmlNodeSetAttribute ( createdcar, "model", "451" )
	  local x, y, z = getElementPosition ( source )
	  local xa,ya,a = getElementRotation ( source )
      xmlNodeSetAttribute ( createdcar, "x", x )
      xmlNodeSetAttribute ( createdcar, "y", y )
      xmlNodeSetAttribute ( createdcar, "z", z )
	  xmlNodeSetAttribute ( createdcar, "a", angle )
	  xmlNodeSetAttribute ( createdcar, "color1", "0" )
	  xmlNodeSetAttribute ( createdcar, "color2", "0" )
      xmlNodeSetAttribute ( createdcar, "owner", "0" )
      xmlNodeSetAttribute ( createdcar, "type", "0" )
	  xmlNodeSetAttribute ( createdcar, "price", "0" )
	  xmlNodeSetAttribute ( createdcar, "lock", "0" )
      cars[maxcars+1] = createVehicle ( 451,x,y,z,0,0,a )
      setElementData (cars[maxcars+1],"xpos",x)
	  setElementData (cars[maxcars+1],"ypos",y)
	  setElementData (cars[maxcars+1],"zpos",z)
	  setElementData (cars[maxcars+1],"angle", a)
      setElementData (cars[maxcars+1],"owner",0)
	  setElementData (cars[maxcars+1],"price",0)
	  setElementData (cars[maxcars+1],"type",0)
	  setElementData (cars[maxcars+1],"lock",0)
      xmlSaveFile(root)
      maxcars = maxcars+1
	else
		outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
	end
end

addCommandHandler ("acarcreate", adminCreateVehicle)
addCommandHandler ("acarsave", saveCars)

function getCar ( car )
	return cars[car]
end

function getVehicleByOwner ( playerid )
	for i,v in ipairs (cars) do
		if getElementData ( cars[i], "owner" ) == playerid then
			return cars[i]
		end
	end
end



function enterVehicle ( source, seat, jacked )
	local playercar = getPedOccupiedVehicle ( source )
	if(seat == 0) then
--		if(tonumber(getElementData ( playercar, "type" )) == 0) then
--			local wantlevel = getPlayerWantedLevel ( source )
--			setPlayerWantedLevel ( source, wantlevel + 1 )
--			outputChatBox (" Вы совершили преступлеие: кража машины!",source, 240,240,240 )
--			for id, factionpl in ipairs ( getElementsByType ( "player" ) ) do
--				if ( tonumber(factions[tonumber(getElementData ( factionpl, "faction" ))][17]) == 1 ) then
--					outputChatBox ("Внимание всем! "..getPlayerName(source).." обьявлен в розыск!",factionpl, 55,204,255 )
--					outputChatBox ("Преступление: Кража машины!",factionpl, 55,204,255 )
--				end
--			end
--		end
		if(tonumber(getElementData ( playercar, "type" )) == 1) then
			if(tonumber(getElementData ( source, "lesson" )) == 1) then
			else
				outputChatBox ("Ошибка: вы не сдаете тест на права!",source, 255,255,127 )
    			setControlState ( source, "enter_exit", true )
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) == 2) then
			if(tonumber(getElementData ( source, "work" )) == 3) then
		--		outputChatBox ("Ошибка: введите /startwork чтобы начать работу!",source, 255,255,127 )
			else
				outputChatBox ("Ошибка: вы не работаете чистильщиком улиц!",source, 255,255,127 )
				removePedFromVehicle ( source )
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) == 3) then
			if(tonumber(getElementData ( source, "work" )) == 4) then
				outputChatBox ("Ошибка: введите /startwork чтобы начать работу!",source, 255,255,127 )
			else
				outputChatBox ("Ошибка: вы не работаете водителем автобуса!",source, 255,255,127 )
				removePedFromVehicle ( source )
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) == 4) then
			if(tonumber(getElementData ( source, "work" )) == 5) then
				outputChatBox ("Ошибка: введите /startwork чтобы начать работу!",source, 255,255,127 )
			else
				outputChatBox ("Ошибка: вы не работаете развозчиком продуктов!",source, 255,255,127 )
				setControlState ( source, "enter_exit", true )
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) == 40) then
		end
		if(tonumber(getElementData ( playercar, "type" )) == 5) then
			if(tonumber(getElementData ( source, "work" )) == 2) then
				outputChatBox ("Ошибка: введите /startwork чтобы начать работу!",source, 255,255,127 )
			else
				outputChatBox ("Ошибка: вы не работаете механиком!",source, 255,255,127 )
    			setControlState ( source, "enter_exit", true )
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) == 6) then
			if tonumber(getElementData ( source, "work" )) == 5 then
				outputChatBox ("Подцепите прицеп, чтобы начать работу",source, 255,255,127 )
			else
				outputChatBox ("Ошибка: вы не работаете дальнобойщиком!",source, 255,255,127 )
    			setControlState ( source, "enter_exit", true )
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) == 7) then
		   	if(tonumber(getElementData ( playercar, "owner" )) > 0) then
		   	    if(tonumber(getElementData ( playercar, "owner" )) == tonumber(getElementData ( source, "playerid" ))) then
		   	        outputChatBox ("Вы арендовали эту машину!",source, 255,255,127 )
				else
	            	outputChatBox ("Эта машина арендована игроком с ИД "..tostring(getElementData ( playercar, "owner" )).."",source, 255,255,127 )
				end
			else
				local price = getElementData ( playercar, "price" )
				triggerClientEvent ( source, "showRentCar", source, price)
				toggleAllControls ( source, false, true, false )
				return true
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) == 8) then
		   	if(tonumber(getElementData ( playercar, "owner" )) > 0) then
		   	    if(tonumber(getElementData ( playercar, "owner" )) == tonumber(getElementData ( source, "playerid" ))) then
		   	        outputChatBox ("Это ваша машина!",source, 255,255,127 )
				else
	            	outputChatBox ("Эта машина пренадлежит игроку с ИД "..tostring(getElementData ( playercar, "owner" )).."",source, 255,255,127 )
				end
			else
				local price = getElementData ( playercar, "price" )
				triggerClientEvent ( source, "showBuyCar", source, price)
				toggleAllControls ( source, false, true, false )
				return true
			end
		end
		if(tonumber(getElementData ( playercar, "type" )) > 9) then
			if((getElementData(source,"faction")+9) ~= getElementData(playercar, "type")) then
				outputChatBox ("Ошибка: у вас нету ключей от этой машины!",source, 255,255,127 )
    			setControlState ( source, "enter_exit", true )
				return true
			end
		end
	else
		local cardriver = getVehicleOccupant ( playercar, 0 )
		if getElementData ( cardriver, "taxiduty" ) ~= nil then
			outputChatBox("Информация: Вы сели к водителю такси, его цена за поездку: "..tostring(getElementData ( cardriver, "taxiduty" )).."$", source, 0,153,51)
			setElementData ( source, "taxipas", getElementData ( cardriver, "playerid" ) )
		end
	end
end

addEventHandler ( "onVehicleEnter", getRootElement(), enterVehicle )

function AcceptToBuyCar ( )
	local playercar = getPedOccupiedVehicle ( source )
	if(tonumber(getElementData ( playercar, "type" )) == 8) then
	    if(getPlayerMoney ( source ) > tonumber(getElementData ( playercar, "price"))) then
   			setElementData ( playercar, "owner", getElementData ( source, "playerid"))
			takePlayerMoney ( source, -tonumber(getElementData ( playercar, "price" )))
			toggleAllControls ( source, true )
			outputChatBox ("Поздравляем с покупкой машины!", source, 243,149,72 )
			giveBizMoney( 11, tonumber(getElementData ( playercar, "price" )), 5000 )
			destroyElement(buycarpickup[getElementData(playercar,num)])
			exports.players:givePlayerXP ( source, 300 )
			exports.achievments:givePlayerAch ( source, "Vehicle buy", 10, 17 )
			saveCars ()
		else
			outputChatBox ("Ошибка: у вас не хватает денег", source, 243,149,72 )
		end
	end
end
addEvent("acceptBuyCar",true)
addEventHandler("acceptBuyCar",root,AcceptToBuyCar)

function AcceptToRentCar ( )
	local playercar = getPedOccupiedVehicle ( source )
	if(tonumber(getElementData ( playercar, "type" )) == 7) then
	    if(getPlayerMoney ( source ) > tonumber(getElementData ( playercar, "price"))) then
   			setElementData ( playercar, "owner", getElementData ( source, "playerid"))
			givePlayerMoney ( source, -tonumber(getElementData ( playercar, "type" )))
			toggleAllControls ( source, true )
			outputChatBox ("Аренда машины закончится в 12:00",source, 243,149,72 )
			local vehicles = getElementsByType ( "vehicle" ) -- get a table of all the players in the server
			for theKey,theCar in ipairs(vehicles) do -- use a generic for loop to step through each player
			   if theCar == playercar then
			        setElementData ( source, "rentcar", theKey )
			    end
			end
			saveCars()
		else
			outputChatBox ("Ошибка: у вас не хватает денег", 243,149,72 )
		end
	end
end
addEvent("acceptRentCar",true)
addEventHandler("acceptRentCar",root,AcceptToRentCar)

function exitVehicle ( thePlayer, seat, jacked ) --when a player enters a vehicle
	local playercar = getPedOccupiedVehicle ( thePlayer )
	if getElementData ( thePlayer, "tied" )  == 0 then
		if getElementData ( thePlayer, "cuff" )  == 0 then
			toggleAllControls ( thePlayer, true )
		end
	end
	if(getElementData(thePlayer, "radioguest") == 1) then
		outputChatBox ("Вы покинули прямой эфир",thePlayer, 72,193,243 )
		outputChatBox ("LVR: Гость "..getPlayerName(thePlayer).." покинул прямой эфир", 243,149,72 )
		setElementData ( thePlayer, "radioguest", 0)
	end
	if(getElementData(thePlayer, "radiodj") == 1) then
		outputChatBox ("Вы покинули прямой эфир",thePlayer, 72,193,243 )
		outputChatBox ("LVR: "..getPlayerName(thePlayer).." покинул прямой эфир", 243,149,72 )
		setElementData ( thePlayer, "radiodj", 0)
	end
	if seat == 0 then
	    setVehicleEngineState ( playercar, false )
	    exports.sweetyRP:sendClientActionMessage ( thePlayer, 2 )
	end
	local cardriver = getVehicleOccupant ( playercar, 0 ) -- get the player sitting in seat 0
	if cardriver then
		if getElementData ( thePlayer, "taxipas" ) > 0 then
			for id, player in ipairs ( getElementsByType ( "player" ) ) do
				if seat ~= 0 then
					if getElementData ( player, "playerid" ) == getElementData ( thePlayer, "taxipas" ) then
						local pay = getElementData ( player, "taxiduty" )
						takePlayerMoney ( thePlayer, pay )
						givePlayerMoney ( player, pay )
						outputChatBox ("Информация: Вы заплатили за поездку на такси  "..tostring(pay).."$",thePlayer, 0,153,51 )
						outputChatBox ("Информация: Вы заработали  "..tostring(pay).."$",player, 0,153,51 )
					end
				end
			end
			setElementData ( thePlayer, "taxipas", 0 )
		end
	end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), exitVehicle )

function SeeTheCars( )
	for i, v in ipairs ( cars ) do
		if getVehicleEngineState ( cars[i] ) then
			if getVehicleOccupant ( cars[i] ) then
			    local driver = getVehicleOccupant ( cars[i] )
			    local currentfuel = getElementData ( cars[i], "fuel" )
				if(getVehicleSpeed(cars[i]) > 0) then
				    if(currentfuel > 1) then
						setElementData(cars[i], "fuel", currentfuel-2)
					else
					    setElementData(cars[i], "fuel", 0)
					end
				else
					setElementData(cars[i], "fuel", currentfuel)
				end
				local newfuel = getElementData ( cars[i], "fuel" )
				if(newfuel == 0) then
	                if driver then
	                	toggleAllControls ( driver, false, true, false )
				   		outputChatBox ( "Бензин кончился! ", driver )
					end
				end
				if(getVehicleOccupant ( cars[i] )) then
					triggerClientEvent ( driver, "updateFuel", driver, newfuel)
				end
				if getElementData ( driver, "cartest" ) > 0 then
	                if(getVehicleSpeed(cars[i]) > 70) then
	                	outputChatBox("Снизьте скорость, иначе тест будет провален!!!", driver, 153,51,0)
					end
				end
			end
		end
	end
end 

function getVehicleSpeed( vehicle )
	if getElementType( vehicle ) ~= "vehicle" then return false end
	return math.floor( getActualVelocity( vehicle, getElementVelocity( vehicle ) ) * 161 )
end

function getActualVelocity( element, x, y, z )
	return (x^2 + y^2 + z^2) ^ 0.5
end
