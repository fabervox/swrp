function beginWork(theTruck)
	local trucker = getVehicleOccupant ( theTruck )
	if getElementData ( trucker, "work" ) == 5 then
		if getElementData ( trucker, "trailerwork" ) < 1 then
			triggerClientEvent ( trucker, "showTrailerStartWork", trucker )	
		end
	end 
    --detachTrailerFromVehicle(theTruck, source) --detach the newly attached trailer
end
addEventHandler("onTrailerAttach", getRootElement(), beginWork )

function finishTrailerWorkS ()
	for k, el in ipairs( getAttachedElements( getPedOccupiedVehicle(source) ) ) do
		--detachTrailerFromVehicle ( getPedOccupiedVehicle(source) )
		destroyElement ( el )
	end
	--setControlState ( source, "enter_exit", true )
	--respawnVehicle ( getAttachedElements ( getPedOccupiedVehicle(source) ) )
	respawnVehicle ( getPedOccupiedVehicle ( source ) )
	removePedFromVehicle ( source )
end

addEvent("finishTrailerWork",true)
addEventHandler("finishTrailerWork",root,finishTrailerWorkS)

function reattachTrailer(theTruck)
	local trucker = getVehicleOccupant ( theTruck )
	if getElementData ( trucker, "work" ) == 5 then
		if getElementData ( trucker, "trailerwork" ) > 0 then
			attachTrailerToVehicle(theTruck, source) -- Reattach the truck and trailer
		end
	end
end
 
addEventHandler("onTrailerDetach", getRootElement(), reattachTrailer)