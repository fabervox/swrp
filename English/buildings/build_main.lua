buildings={}
buildpickup={}

function loadBuildings ()
  local root = xmlLoadFile ("buildings.xml")
  local buildingroot = xmlFindChild (root,"build",0)
  local loadcomplete = 0
  if (buildingroot) then
    for i,v in ipairs (xmlNodeGetChildren(buildingroot)) do
      local type = xmlNodeGetAttribute (v,"type")
      local name = xmlNodeGetAttribute (v,"name")
	  local number = xmlNodeGetAttribute (v,"num")
      local x = xmlNodeGetAttribute (v,"x")
      local y = xmlNodeGetAttribute (v,"y")
      local z = xmlNodeGetAttribute (v,"z")
      local exitx = xmlNodeGetAttribute (v,"ex")
      local exity = xmlNodeGetAttribute (v,"ey")
      local exitz = xmlNodeGetAttribute (v,"ez")
	  local dim = xmlNodeGetAttribute (v,"dim")
      local interior = xmlNodeGetAttribute (v,"int")
      local x2 = xmlNodeGetAttribute (v,"x2")
      local y2 = xmlNodeGetAttribute (v,"y2")
      local z2 = xmlNodeGetAttribute (v,"z2")
      local exitx2 = xmlNodeGetAttribute (v,"ex2")
      local exity2 = xmlNodeGetAttribute (v,"ey2")
      local exitz2 = xmlNodeGetAttribute (v,"ez2")
	  local pick1 = createPickup ( x, y, z, 3, 1318, 3000 )
	  local pick3 = createPickup ( exitx, exity, exitz, 3, 1318, 3000 )
	  setElementInterior ( pick3, interior )
	  if (tonumber(x2) > 0) then
	    local pick2 = createPickup ( x2, y2, z2, 3, 1318, 3000 )
	    local pick4 = createPickup ( exitx2, exity2, exitz2, 3, 1318, 3000 )
	    setElementInterior ( pick4, interior )
	  end
	  if name == "LVPD" then
	  	createBlipAttachedTo ( pick1, 30, 2, 255, 0, 0, 255, 0, 330 )
	  end
	  buildpickup[i]={pick1,pick2,pick3,pick4}
	  buildings[i]={type,name,number,x,y,z,exitx,exity,exitz,dim,interior,x2,y2,z2,exitx2,exity2,exitz2}
	  loadcomplete = 1
    end
    if loadcomplete == 1 then
  		outputDebugString ("Buildings loaded!")
 	else
		outputDebugString ("Buildings not loaded!")
  	end
  end
end

addEventHandler ( "onResourceStart", getResourceRootElement(), loadBuildings )

function toBuilding ( player )
    for i,v in ipairs (buildpickup) do
    	local bx = buildings[i][4]
    	local by = buildings[i][5]
    	local bz = buildings[i][6]
    	local bx2 = buildings[i][12]
    	local by2 = buildings[i][13]
    	local bz2 = buildings[i][14]
    	local bex = buildings[i][7]
    	local bey = buildings[i][8]
    	local bez = buildings[i][9]
    	local bex2 = buildings[i][15]
    	local bey2 = buildings[i][16]
    	local bez2 = buildings[i][17]
		if(exports.sweetyRP:playerToPoint(player, 3, bx, by, bz)) then
			setElementPosition(player, buildings[i][7], buildings[i][8], buildings[i][9])
			setElementInterior ( player, buildings[i][11] )
  			exports.players:entSucces ( player )
			return true
		end
		if(exports.sweetyRP:playerToPoint(player, 3, bx2, by2, bz2)) then
			setElementPosition(player, buildings[i][15], buildings[i][16], buildings[i][17])
			setElementInterior ( player, buildings[i][11] )
			exports.players:entSucces ( player )
			return true
		end
		if(exports.sweetyRP:playerToPoint(player, 3, bex, bey, bez)) then
			setElementPosition(player, buildings[i][4], buildings[i][5], buildings[i][6])
			setElementInterior ( player, 0 )
			return true
		end
		if(exports.sweetyRP:playerToPoint(player, 3, bex2, bey2, bez2)) then
			setElementPosition( player, buildings[i][12], buildings[i][13], buildings[i][14])
			setElementInterior ( player, 0 )
			return true
		end
	end
end