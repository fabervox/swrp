function adminSetCarModel ( source, cmd, model )
	if(model) then
		if((tonumber(model) > 399) and (tonumber(model) < 612))then
			if(tonumber(getElementData(source,"admlvl")) > 2) then
			    if(isPedInVehicle(source)) then
			   		local playercar = getPedOccupiedVehicle ( source )
		      		setElementModel (playercar,tonumber(model))
		      		saveCars()
				else
				    outputChatBox ("Ошибка: вы не в машине",source, 255,255,127 )
				end
			else
				outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
			end
		else
			outputChatBox ("Ошибка: модель машины должна быть между 400 и 611",source, 255,255,127 )
		end
	else
		outputChatBox ("Правильно: /acarmodel модель машины",source, 255,255,127 )
	end
end

addCommandHandler ("acarmodel", adminSetCarModel)

function adminSetCarColor ( source, cmd, color1, color2 )
	if(color2) then
		if(tonumber(getElementData(source,"admlvl")) > 2) then
		    if(isPedInVehicle(source)) then
		   		local playercar = getPedOccupiedVehicle ( source )
    	  		setVehicleColor (playercar,color1,color2,0,0)
    	  		saveCars()
			else
			    outputChatBox ("Ошибка: вы не в машине",source, 255,255,127 )
			end
		else
			outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
		end
	 else
		outputChatBox ("Правильно: /acarcolor цвет 1 цвет 2",source, 255,255,127 )
	end
end

addCommandHandler ("acarcolor", adminSetCarColor)

function adminSetCarType ( source, cmd, cartype )
	if(cartype) then
		if(tonumber(getElementData(source,"admlvl")) > 2) then
		    if(isPedInVehicle(source)) then
		   		local playercar = getPedOccupiedVehicle ( source )
    	  		setElementData(playercar, "type", tonumber(cartype))
    	  		outputChatBox ("Вы установили машине "..tostring(playercar).." тип "..tostring(cartype).."",source, 243,149,72 )
    	  		saveCars()
			else
			    outputChatBox ("Ошибка: вы не в машине",source, 255,255,127 )
			end
		else
			outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
		end
	 else
		outputChatBox ("Правильно: /acartype тип машины",source, 255,255,127 )
	end
end

addCommandHandler ("acartype", adminSetCarType)

function adminSetCarPrice ( source, cmd, carprice )
	if(carprice) then
		if(tonumber(getElementData(source,"admlvl")) > 2) then
		    if(isPedInVehicle(source)) then
		   		local playercar = getPedOccupiedVehicle ( source )
    	  		setElementData(playercar, "price", tonumber(carprice))
    	  		outputChatBox ("Вы установили машине "..tostring(playercar).." цену "..tostring(carprice).." долларов",source, 243,149,72 )
    	  		saveCars()
			else
			    outputChatBox ("Ошибка: вы не в машине",source, 255,255,127 )
			end
		else
			outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
		end
	 else
		outputChatBox ("Правильно: /acarprice цена машины",source, 255,255,127 )
	end
end

addCommandHandler ("acarprice", adminSetCarPrice)

function adminSetCarPark ( source, cmd)
	if(tonumber(getElementData(source,"admlvl")) > 2) then
	    if(isPedInVehicle(source)) then
	   		local playercar = getPedOccupiedVehicle ( source )
	   		local x, y, z = getElementPosition ( source )
	   		local xa,ya,a = getElementRotation ( source )
	   		setElementData (playercar,"xpos",x)
			setElementData (playercar,"ypos",y)
  			setElementData (playercar,"zpos",z)
  			setElementData (playercar,"angle",a)
  			outputChatBox ("Вы установили машине "..tostring(playercar).." позицию появления",source, 243,149,72 )
	  		saveCars()
		else
		    outputChatBox ("Ошибка: вы не в машине",source, 255,255,127 )
		end
	else
		outputChatBox ("Ошибка: вы не можете использовать эту команду",source, 255,255,127 )
	end
end

addCommandHandler ("acarpark", adminSetCarPark)

function playerCarPark ( source, cmd)
    if(isPedInVehicle(source)) then
	   	local playercar = getPedOccupiedVehicle ( source )
		if(getElementData ( playercar, "owner" ) == getElementData ( source, "playerid" )) then
	   		local x, y, z = getElementPosition ( source )
	   		local xa,ya,a = getElementRotation ( playercar )
	   		setElementData (playercar,"xpos",x)
			setElementData (playercar,"ypos",y)
			setElementData (playercar,"zpos",z)
			setElementData (playercar,"angle",a)
			outputChatBox ("Вы припарковали свою машину, не забудьте её закрыть!",source, 243,149,72 )
	  		saveCars()
		else
			outputChatBox ("Ошибка: это не ваша машина!",source, 255,255,127 )
		end
    else
		outputChatBox ("Ошибка: вы не в машине",source, 255,255,127 )
	end
end

addCommandHandler ("carpark",playerCarPark)

function playerCarLock ( source, cmd)
    for i,v in ipairs (cars) do
		if(getElementData ( cars[i], "owner" ) == getElementData ( source, "playerid" )) then
       	    setVehicleLocked ( cars[i], true )
            setElementData (cars[i],"lock", 1)
            outputChatBox ("Вы закрыли свою машину.",source, 243,149,72 )
	  		saveCars()
		end
	end
end

addCommandHandler ("lockmycar",playerCarLock)


function playerCarUnLock ( source, cmd)
    for i,v in ipairs (cars) do
		if(getElementData ( cars[i], "owner" ) == getElementData ( source, "playerid" )) then
       	    	setVehicleLocked ( cars[i], false )
                setElementData (cars[i],"lock", 0)
		end
		outputChatBox ("Вы открыли свою машину.",source, 243,149,72 )
	  	saveCars()
	end
end

addCommandHandler ("unlockmycar",playerCarUnLock)
